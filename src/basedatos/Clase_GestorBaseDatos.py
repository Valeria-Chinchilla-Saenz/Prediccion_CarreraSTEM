import pandas as pd
import urllib
from sqlalchemy import create_engine

#BASE DE DATOS/////////////////////////////////////////////////////////////////
class carga_base_datos:
    def __init__(self, db, usuario, contrasena):
        self.engine = self.car_base_datos(db, usuario, contrasena)
#*****************************************************
    @staticmethod
    def car_base_datos(db, usuario, contrasena):
        try:
            host = "localhost"
            if not usuario or not contrasena:
                conn_str = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={host};DATABASE={db};Trusted_Connection=yes;Encrypt=yes;TrustServerCertificate=yes;"
            else:
                conn_str =f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={host};DATABASE={db};UID={usuario};PWD={contrasena};Encrypt=yes;TrustServerCertificate=yes;"

            params = urllib.parse.quote_plus(conn_str)
            return create_engine(f"mssql+pyodbc:///?odbc_connect={params}")

        except Exception as e:
            print(f"Error de conexión SQL: {e}")
            return None
#******************************************************************
    def leer_tabla(self, nombre_tabla):
        if self.engine:
            return pd.read_sql(f"SELECT * FROM {nombre_tabla}", self.engine)
        return None