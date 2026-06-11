#Inspirar de "cajero-automatico" seccion dedicada solo a registrar la venta para que vaya directo a historial_ventas y modifique el inventario. Hacer de momento una version 1.0 con un producto por venta}

import tkinter as tk
from tkinter import ttk, messagebox 

#Empleado

class registro_ventas(tk.Frame):
    def __init__(self, parent, bd):
        super().__init__(parent)
        self.bd = bd
        self.id_seleccionado = None
        self.ingresar_registro()
        
    #Empleado
    def ingresar_registro(self):
        form = ttk.LabelFrame(self, text="Registro de venta", padding=5)
        form.pack(fill=tk.X, padx=12, pady=6)
        form.columnconfigure(0, weight=1)

        ttk.Label(form, text="Ingresar ID del empleado", font=("comfortaa", 12, "bold")).grid(row=1,column=0,padx=6, pady=6)
        self.entry_empleado = ttk.Entry(form, width=60)
        self.entry_empleado.grid(row=2, column=0, padx=12, pady=12)
        
        ttk.Label(form, text="ID del producto", font=("comfortaa", 12, "bold")).grid(row=3,column=0,padx=6, pady=6)
        self.entry_producto = ttk.Entry(form, width=60)
        self.entry_producto.grid(row=4, column=0, padx=12, pady=12)
        
        ttk.Label(form, text="Cantidad de producto", font=("comfortaa", 12, "bold")).grid(row=5,column=0,padx=6, pady=6)
        self.entry_cantidad = ttk.Entry(form, width=60)
        self.entry_cantidad.grid(row=6, column=0, padx=12, pady=12)

        ttk.Label(form, text="Ingrese Id del cliente", font=("comfortaa", 12, "bold")).grid(row=7,column=0,padx=6, pady=6)
        self.entry_cliente = ttk.Entry(form, width=60)
        self.entry_cliente.grid(row=8, column=0, padx=12, pady=12)
        
        form_btn = ttk.Frame(self)
        form_btn.pack(fill=tk.BOTH, padx=12, pady=6)

        estilo = ttk.Style()
        estilo.configure("TButton", font=("comfortaa", 12), padding=10)

        ttk.Button(form_btn, text="Guardar Venta", style="TButton", command=self.guardar).pack(padx=5)

    def guardar(self):
        id_empleado, id_producto, cantidad, id_cliente, fecha_venta = self.entry_empleado.get().strip(), self.entry_producto.get().strip(), self.entry_cantidad.get().strip(), self.entry_cliente.get().strip()
        if not id_empleado or not id_producto or not cantidad:
            return messagebox.showwarning("Advertencia", "Nombre y Apellido son obligatorios.")
        if self.db.ejecutar_consulta("INSERT INTO ventas (id_producto, id_cliente, id_empleado, fecha_venta, cantidad) VALUES (%s, %s, %s, %s, %s)", (id_producto, id_cliente, id_empleado, fecha_venta, cantidad)):
            messagebox.showinfo("Venta Guardada con exito")
            self.limpiar()
            self.cargar_datos()

