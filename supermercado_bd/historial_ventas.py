
import tkinter as tk
from tkinter import ttk, messagebox 

class historial_ventas(tk.Frame):
    def __init__(self, parent, bd):
        super().__init__(parent)
        self.bd = bd
        self.id_seleccionado = None
        self.editar_tabla()
        self.cargar_datos()

    def editar_tabla(self):
        frame_form = ttk.LabelFrame(self, text="Editar Venta", padding=10)
        frame_form.pack(fill=tk.X, padx=10, pady=5)

        ttk.Label(frame_form, text="Producto:").grid(row=0, column=0, padx=5, pady=5)
        self.entry_producto = ttk.Entry(frame_form, width=20)
        self.entry_producto.grid(row=0, column=1, padx=5, pady=5)
 
        ttk.Label(frame_form, text="Cantidad:").grid(row=0, column=2, padx=5, pady=5)
        self.entry_cantidad = ttk.Entry(frame_form, width=10)
        self.entry_cantidad.grid(row=0, column=3, padx=5, pady=5)

        frame_btn = ttk.Frame(self)
        frame_btn.pack(fill=tk.X, padx=10, pady=5)
        ttk.Button(frame_btn, text="Actualizar", command=self.actualizar).pack(side=tk.LEFT, padx=5)
        ttk.Button(frame_btn, text="Eliminar", command=self.eliminar).pack(side=tk.LEFT, padx=5)
        ttk.Button(frame_btn, text="Limpiar", command=self.limpiar).pack(side=tk.LEFT, padx=5)
 
        self.tree = self.crear_tabla(
            ("id", "producto", "cliente", "empleado", "fecha", "cantidad"),
            ("ID Venta", "Producto", "Cliente", "Empleado", "Fecha", "Cantidad"),
            (60, 220, 180, 160, 100, 80),
        )
        self.tree.bind("<ButtonRelease-1>", self.seleccionar)

    def crear_tabla(self, cols_id, cols_text, anchos):
        frame = ttk.Frame(self)
        frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        tree = ttk.Treeview(frame, columns=cols_id, show="headings")
        for col_id, col_text, ancho in zip(cols_id, cols_text, anchos):
            tree.heading(col_id, text=col_text)
            tree.column(
                col_id, width=ancho, anchor=tk.CENTER if col_id in ("id", "cantidad", "fecha") else tk.W
            )
        scrollbar = ttk.Scrollbar(frame, orient=tk.VERTICAL, command=tree.yview)
        tree.configure(yscrollcommand=scrollbar.set)
        tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        return tree
    
    def cargar_datos(self):
        for item in self.tree.get_children():
            self.tree.delete(item)
        for row in self.bd.obtener_datos("""
            SELECT v.id_venta, p.nombre_producto, c.nombre AS cliente,
                   e.nombre_empleado, v.fecha_venta, v.cantidad
            FROM ventas v
            JOIN productos p ON v.id_producto = p.id_producto
            JOIN clientes c ON v.id_cliente = c.id_cliente
            JOIN empleados e ON v.id_empleado = e.id_empleado
            ORDER BY v.id_venta DESC
        """):

            self.tree.insert(
                "",
                tk.END,
                values=(
                    row["id_venta"],
                    row["nombre_producto"],
                    row["cliente"],
                    row["nombre_empleado"],
                    row["fecha_venta"],
                    row["cantidad"],
                ),
            )

    def seleccionar(self, event):
        seleccion = self.tree.selection()
        if not seleccion:
            return
        

        valores = self.tree.item(seleccion, "values")
        self.id_seleccionado = valores[0]
        self.cantidad_original = int(valores[5])

        datos_producto = self.bd.obtener_datos(
            "SELECT id_producto FROM ventas WHERE id_venta = %s",(self.id_seleccionado,)
        )
        if datos_producto:
            self.id_producto_original = datos_producto[0]["id_producto"]

        self.entry_cantidad.delete(0, tk.END);
        self.entry_cantidad.insert(0, valores[5])

        self.entry_producto.delete(0, tk.END);
        self.entry_producto.insert(0, valores[1])


    def actualizar(self):
        if not self.id_seleccionado:
            self.cargar_datos()
            messagebox.showwarning("Advertencia","Selecciona un producto")
        
 
        nuevo_producto = self.entry_producto.get().strip()
        nueva_cantidad = self.entry_cantidad.get().strip()
 
        if not nueva_cantidad.isdigit() or not nuevo_producto:
            return messagebox.showwarning("Advertencia", "El ID y la cantidad deben ser numericos")

        nueva_cantidad = int(nueva_cantidad)
        if nueva_cantidad <= 0:
            return messagebox.showwarning("Advertencia", "La cantidad debe ser mayor a 0")

        diferencia = nueva_cantidad - self.cantidad_original
 
        if diferencia > 0:
            stock = self.bd.obtener_datos(
                "SELECT cantidad_stock FROM inventario WHERE id_producto = %s",
                (self.id_producto_original,),
            )
            if not stock or stock[0]["cantidad_stock"] < diferencia:
                return messagebox.showerror(
                    "Error", "No hay suficiente stock en el inventario"
                )
 
        resultado = self.bd.ejecutar_consulta(
            "UPDATE ventas SET cantidad = %s WHERE id_venta = %s",
            (nueva_cantidad, self.id_seleccionado),
        )

        if resultado is not None:
            if diferencia != 0:
                self.bd.ejecutar_consulta(
                    "UPDATE inventario SET cantidad_stock = cantidad_stock - %s WHERE id_producto = %s",
                    (diferencia, self.id_producto_original),
                )
            messagebox.showinfo("Éxito", "Venta actualizada")
            self.limpiar()
            self.cargar_datos()

    def eliminar(self):
        if not self.id_seleccionado:
            return messagebox.showwarning("Advertencia", "Selecciona una venta")
 
        if messagebox.askyesno(
            "Confirmar", "¿Eliminar esta venta? La cantidad se devolverá al inventario"
        ):
            try:
                resultado = self.bd.ejecutar_consulta(
                    "DELETE FROM ventas WHERE id_venta = %s", (self.id_seleccionado,)
                )
                if resultado is not None:
                    self.bd.ejecutar_consulta(
                        "UPDATE inventario SET cantidad_stock = cantidad_stock + %s WHERE id_producto = %s",
                        (self.cantidad_original, self.id_producto_original),
                    )
                    messagebox.showinfo("Éxito", "Venta eliminada y stock restaurado")
                    self.limpiar()
                    self.cargar_datos()
            except Exception:
                messagebox.showerror("Error","No se pudo eliminar.")

    def limpiar(self):
        self.id_seleccionado = None
        self.entry_producto.delete(0, tk.END)
        self.entry_cantidad.delete(0, tk.END)