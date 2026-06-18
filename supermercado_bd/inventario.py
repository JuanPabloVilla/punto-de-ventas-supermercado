
import tkinter as tk
from tkinter import ttk, messagebox

class inventario_mercado(tk.Frame):
    def __init__(self, parent, bd):
        super().__init__(parent)
        self.bd = bd
        self.id_seleccionado = None
        self.editar_inventario()
        self.cargar_datos()

    def editar_inventario(self):
        form = ttk.LabelFrame(self, text="Inventario", padding=10)
        form.pack(fill=tk.X, padx=5,pady=5)

        ttk.Label(form, text="Producto:").grid(row=0, column=0, padx=5, pady=5)
        self.entry_producto = ttk.Entry(form, width=10)
        self.entry_producto.grid(row=0, column=1, padx=5, pady=5)

        ttk.Label(form, text="Cantidad:").grid(row=0, column=2, padx=5, pady=5)
        self.entry_cantidad = ttk.Entry(form, width=10)
        self.entry_cantidad.grid(row=0, column=3, padx=5, pady=5)

        ttk.Label(form, text="Precio:").grid(row=0, column=4, padx=5, pady=5)
        self.entry_precio = ttk.Entry(form, width=10)
        self.entry_precio.grid(row=0, column=5, padx=5, pady=5)

        frame_btn = ttk.Frame(self)
        frame_btn.pack(fill=tk.X, padx=10, pady=5)
        ttk.Button(frame_btn, text="Actualizar", command=self.actualizar).pack(side=tk.LEFT, padx=5)
        ttk.Button(frame_btn, text="Eliminar", command=self.eliminar).pack(side=tk.LEFT, padx=5)
        ttk.Button(frame_btn, text="Limpiar", command=self.limpiar).pack(side=tk.LEFT, padx=5)        

        self.tree = self.crear_tabla(
            ("id", "producto", "cantidad", "precio"),
            ("ID Producto", "Producto", "Cantidad", "Precio"),
            (80,180,80, 100)
        )
        self.tree.bind("<ButtonRelease-1>", self.seleccionar)

    def crear_tabla(self, cols_id, cols_text, anchos):
        frame = ttk.Frame(self)
        frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        tree = ttk.Treeview(frame, columns=cols_id,show="headings")
        for col_id, col_text, ancho in zip(cols_id, cols_text, anchos):
            tree.heading(col_id, text=col_text)
            tree.column(
                col_id, width=ancho, anchor=tk.CENTER if
                col_id in ("id", "cantidad", "precio")
                else tk.W
            )
        scrollbar = ttk.Scrollbar(frame, orient=tk.VERTICAL, command=tree.yview)
        tree.configure(yscrollcommand=scrollbar.set)
        tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        return tree
    
    def cargar_datos(self):
        for i in self.tree.get_children():
            self.tree.delete(i)
        query = '''
            SELECT p.id_producto, i.cantidad_stock,p.nombre_producto, p.precio
            FROM productos p 
            JOIN inventario i ON p.id_producto = i.id_producto 
            ORDER BY i.id_producto ASC
        '''
        for row in self.bd.obtener_datos(query):
            tags = ("bajo_stock,") if row["cantidad_stock"] < 5 else()
            self.tree.insert("",tk.END,
                values=(
                    row["id_producto"],
                    row["nombre_producto"],
                    row["cantidad_stock"],
                    row["precio"]
                ), tags=tags
            )

    def seleccionar(self, event):
        seleccion = self.tree.selection()
        if not seleccion:
            return
        
        valores = self.tree.item(seleccion[0], "values")
        self.id_seleccionado = valores[0]

        self.entry_producto.delete(0, tk.END)
        self.entry_producto.insert(0, valores[1])
 
        self.entry_cantidad.delete(0, tk.END)
        self.entry_cantidad.insert(0, valores[2])
 
        self.entry_precio.delete(0, tk.END)
        self.entry_precio.insert(0, valores[3])

    def actualizar(self):
        if not self.id_seleccionado:
            self.cargar_datos()
            messagebox.showwarning("Advertencia","Selecciona un producto")

        
        nombre = self.entry_producto.get().strip()
        cantidad = self.entry_cantidad.get().strip()
        precio = self.entry_precio.get().strip()

        if not nombre or not precio or not cantidad.isdigit():
            return messagebox.showwarning("Advertencia", "La cantidad y/o el precio deben ser numericos y el nombre no puede estar vacio")
        
        cantidad = int(cantidad)
        precio = float(precio)
        if cantidad <= 0 or precio <= 0:
            return messagebox.showwarning("Advertencia", "La cantidad debe ser mayor a 0")
        
        self.bd.ejecutar_consulta(
            "UPDATE productos SET nombre_producto = %s, precio = %s WHERE id_producto = %s",
            (
                nombre, precio, self.id_seleccionado
            ),
        )
        self.bd.ejecutar_consulta(
            "UPDATE inventario SET cantidad_stock = %s WHERE id_producto = %s",
            (cantidad, self.id_seleccionado)
        )

        messagebox.showinfo("Exito","Producto Actualizado")
        self.limpiar()
        self.cargar_datos()

    def eliminar(self):
        if not self.id_seleccionado:
            return messagebox.showwarning("Advertencia","Selecciona un producto")
        
        if messagebox.askyesno(
            "Confirmar", "¿Eliminar el producto?"
        ):
            self.bd.ejecutar_consulta(
                "DELETE FROM inventario WHERE id_producto = %s", (self.id_seleccionado,)
            )
            self.bd.ejecutar_consulta(
                "DELETE FROM productos WHERE id_producto = %s", (self.id_seleccionado,)
                )
            messagebox.showwarning("Exito", "Producto eliminado del inventario")
            self.limpiar()
            self.cargar_datos()

    def limpiar(self):
        self.id_seleccionado = None
        self.entry_producto.delete(0,tk.END)
        self.entry_cantidad.delete(0,tk.END)
        self.entry_precio.delete(0,tk.END)