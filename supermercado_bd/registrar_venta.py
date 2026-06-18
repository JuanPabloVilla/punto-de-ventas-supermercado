
import tkinter as tk
from tkinter import ttk, messagebox 

class registro_ventas(tk.Frame):
    def __init__(self, parent, bd):
        super().__init__(parent)
        self.bd = bd
        self.ingresar_registro()
        
    def ingresar_registro(self):
        form = ttk.LabelFrame(self, text="Registro de venta", padding=10)
        form.pack(fill=tk.X, padx=12, pady=10)
        form.columnconfigure(0, weight=1)

        ttk.Label(form, text="Ingresar ID del empleado", font=("comfortaa", 12, "bold")).grid(row=1,column=0,padx=6, pady=6)
        self.entry_empleado = ttk.Entry(form, width=35)
        self.entry_empleado.grid(row=2, column=0, padx=12, pady=12)
        
        ttk.Label(form, text="ID del producto", font=("comfortaa", 12, "bold")).grid(row=3,column=0,padx=6, pady=6)
        self.entry_producto = ttk.Entry(form, width=35)
        self.entry_producto.grid(row=4, column=0, padx=12, pady=12)
        
        ttk.Label(form, text="Cantidad de producto", font=("comfortaa", 12, "bold")).grid(row=5,column=0,padx=6, pady=6)
        self.entry_cantidad = ttk.Entry(form, width=35)
        self.entry_cantidad.grid(row=6, column=0, padx=12, pady=12)

        ttk.Label(form, text="Ingrese cedula del cliente", font=("comfortaa", 12, "bold")).grid(row=7,column=0,padx=6, pady=6)
        self.entry_cliente = ttk.Entry(form, width=35)
        self.entry_cliente.grid(row=8, column=0, padx=12, pady=12)
        
        form_btn = ttk.Frame(self)
        form_btn.pack(fill=tk.BOTH, padx=12, pady=6)

        estilo = ttk.Style()
        estilo.configure("TButton", font=("comfortaa", 12), padding=10)

        ttk.Button(form_btn, text="Guardar Venta", style="TButton", command=self.guardar).pack(padx=5)

    def guardar(self):
        id_empleado = self.entry_empleado.get().strip()
        id_producto = self.entry_producto.get().strip()
        cantidad = self.entry_cantidad.get().strip()
        cedula = self.entry_cliente.get().strip()

        if not id_empleado or not id_producto or not cantidad or not cedula:
            return messagebox.showwarning("Advertencia", "Revise valores no ingresados.")
        

        cantidad = int(cantidad)
        if cantidad <= 0:
            return messagebox.showwarning("Advertencia", "Debe ingresar valor mayor a 0")
        
        cliente = self.bd.obtener_datos("SELECT id_cliente FROM clientes WHERE cedula = %s",(cedula,))
        if not cliente:
            return messagebox.showerror("Error","Revise el numero de cedula del cliente")
        id_cliente= cliente[0]['id_cliente']
        
        empleado = self.bd.obtener_datos("SELECT id_empleado FROM empleados WHERE id_empleado = %s",(id_empleado,))
        if not empleado:
            return messagebox.showerror("Advertencia", "ID del empleado no valido")

        stock = self.bd.obtener_datos("SELECT cantidad_stock FROM inventario WHERE id_producto = %s", (id_producto,))
        if not stock:
            return messagebox.showerror("Advertencia", "Cantidad en stock insuficiente")

        self.bd.ejecutar_consulta(
            "INSERT INTO ventas (id_producto, id_cliente, id_empleado, fecha_venta ,cantidad) VALUES (%s, %s, %s, CURDATE(), %s)", (id_producto, id_cliente, id_empleado,cantidad),)
            

        self.bd.ejecutar_consulta("UPDATE inventario SET cantidad_stock = cantidad_stock - %s WHERE id_producto = %s", (cantidad, id_producto),)
        messagebox.showinfo("Listo", "Venta registrada")
        self.limpiar()

    def limpiar(self):
        self.entry_empleado.delete(0, tk.END)
        self.entry_producto.delete(0, tk.END)
        self.entry_cantidad.delete(0, tk.END)
        self.entry_cliente.delete(0, tk.END)