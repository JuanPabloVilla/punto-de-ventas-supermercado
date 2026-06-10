import mysql.connector
from mysql.connector import Error

class Conexion:
    def __init__(self):
        self.config = {
            'host': 'localhost',
            'user': 'root',
            'password': '',      # Tu contraseña de MySQL
            'database': 'supermercado_barrio'
        }
        self.conn = None

    def conectar(self):
        try:
            if self.conn is None or not self.conn.is_connected():
                self.conn = mysql.connector.connect(**self.config)
            return self.conn
        except Error as e:
            print(f"Error al conectar a MySQL: {e}")
            return None

    def ejecutar_consulta(self, query, params=None):
        conn = self.conectar()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute(query, params or ())
                conn.commit()
                ultimo_id = cursor.lastrowid
                cursor.close()
                return ultimo_id
            except Error as e:
                print(f"Error en la modificación: {e}")
                conn.rollback()
                return None

    def obtener_datos(self, query, params=None):
        conn = self.conectar()
        if conn:
            try:
                cursor = conn.cursor(dictionary=True)
                cursor.execute(query, params or ())
                resultados = cursor.fetchall()
                cursor.close()
                return resultados
            except Error as e:
                print(f"Error al obtener datos: {e}")
                return []

    def cerrar(self):
        if self.conn and self.conn.is_connected():
            self.conn.close()
            self.conn = None