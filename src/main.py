from datos.Clase_GestorDatos import *
from api.Clase_ClienteAPI import *
from basedatos.Clase_GestorBaseDatos import *
from eda.Clase_ProcesadorEDA import  *
#from modelos.prueba_algoritmos import*
import numpy as np
import os

# 1. CSV////////////////////////////////////////////////////////////////////////////
base_dir = os.path.dirname(os.path.abspath(__file__))
root_project = os.path.dirname(base_dir)

ruta_csv = os.path.join(root_project, "data", "raw", "Matricula_Estatal_2019_2022")
print(f"Buscando en: {ruta_csv}")
datos_csv = carga_csv(ruta_csv)
if datos_csv.df_csv is not None:
    print(datos_csv.df_csv.head())

# API///////////////////////////////////////////////////////////////////////////////
url_api = "https://api-cepalstat.cepal.org/cepalstat/api/v1/indicator/4688/data?lang=es&format=json&in=188"
datos_api = carga_api(url_api)
if datos_api.df_api is not None:
    print(datos_api.df_api.head())

# SQL/////////////////////////////////////////////////////////////////////////////
user = input("Usuario: ")
password = input("Contraseña: ")
datos_db = carga_base_datos("info_his_educacion_superior", user, password)

if datos_db.engine:
    # lee las tablas individuales
    df_internet_reg = datos_db.leer_tabla("prom_int_region")
    df_salarios_car = datos_db.leer_tabla("prom_sal_carrera")

    if df_internet_reg is not None:
        print("\nTabla: Promedio Acceso Internet por Region")
        print(df_internet_reg.head())
        print(f"Dimensiones: {df_internet_reg.shape}")

    if df_salarios_car is not None:
        print("\nTabla: Promedio Salarios por Carrera")
        print(df_salarios_car.head())
        print(f"Dimensiones: {df_salarios_car.shape}")
else:
    print("No se pudo establecer la conexion con el servidor SQL.")




#LIMPIEZA//////////////////////////////////////////////////////////////////////////////////////////////

if __name__ == "__main__":
    #limpiar csv
    df_csv_limpio = Procesador_EDA.limpieza_pro(datos_csv.df_csv)

    # lipiar api
    df_api_limpio = Procesador_EDA.limpieza_pro(datos_api.df_api)

    #limpiar base de datos
    df_db_limpio1 = Procesador_EDA.limpieza_pro(datos_db.leer_tabla("prom_int_region"))
    df_db_limpio2 = Procesador_EDA.limpieza_pro(datos_db.leer_tabla("prom_sal_carrera"))


    print(df_csv_limpio.head())
    print(df_api_limpio.head())
    print(df_db_limpio1.head())
    print(df_db_limpio2.head())

    print("CSV columnas:", df_csv_limpio.columns.tolist())
    print("API columnas:", df_api_limpio.columns.tolist())
    print("DB1 columnas:", df_db_limpio1.columns.tolist())
    print("DB2 columnas:", df_db_limpio2.columns.tolist())


#UNION PARA EL MODELO////////////////////////////////////////////////////////////////////////////////////////////
    df_final = Procesador_EDA.preparar_datos(df_csv_limpio, df_api_limpio, df_db_limpio1, df_db_limpio2)
    #segunda limpieza
    print(" Dataset final con las columnas que se van a utilizar:")
    eda = Procesador_EDA(df_final)
    eda.limpiar_edad()
    eda.eliminar_columnas()
    df_final = eda.dataframe

    print(f"\nDataset final: {df_final.shape}")
    print("Primeras vistas de las fuentes unidas")
    print(df_final.columns.tolist())
    print(df_final.head())
    print(df_final.dtypes)
    print(df_final.describe())
    print(df_final.isnull().sum())