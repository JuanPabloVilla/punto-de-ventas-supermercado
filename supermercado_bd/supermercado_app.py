
import tkinter as tk
from tkinter import messagebox
from tkinter import ttk
from conexion_db import Conexion
from registrar_venta import registro_ventas
from historial_ventas import historial_ventas
from inventario import inventario_mercado

def main():
    ventana = tk.Tk()
    ventana.title("gestion de ventas supermercado")
    ventana.geometry("850x500")
    
    bd = Conexion()
    
    if not bd.conectar():
        messagebox.showerror("Error", "No se pudo acceder al sistema, revisa conexion.py")
        return
    
    tabs = ttk.Notebook(ventana)
    tabs.pack(fill=tk.BOTH, expand=True, padx=12, pady=12)
    
    pes_registro = registro_ventas(tabs, bd)
    pes_hisorial = historial_ventas(tabs, bd)
    pes_inventario = inventario_mercado(tabs, bd)

    
    tabs.add(pes_registro, text="Registrar Venta")
    tabs.add(pes_hisorial, text="Historial ventas")
    tabs.add(pes_inventario, text="Inventario")

    ventana.mainloop()
    
'''    

    pes_historial = historial_ventas(tabs, bd)
    pes_inventario = inventario_mercado(tabs, bd)
    tabs.add(pes_historial, text="Historial de ventas")
    tabs.add(pes_inventario, text="Editar inventario")
    '''    
main()