import sys
from pathlib import Path
import pandas as pd
import unicodedata

class Procesador_EDA:
    def __init__(self, dataframe):
        self.dataframe = dataframe

    @staticmethod
    def limpieza_pro(df):
        if df is None: return None

        # Funcion para quitar tildes, eñes y espacios
        def normalizar(texto):
            if not isinstance(texto, str): return texto
            # Quita tildes y eñes
            texto = unicodedata.normalize('NFKD', texto).encode('ascii', 'ignore').decode('utf-8')
            # Minusculas y guiones bajos
            return texto.strip().lower().replace(" ", "_")

        # Limpiar columnas
        df.columns = [normalizar(c) for c in df.columns]

        # Limpiar todas las celdas de texto
        for col in df.select_dtypes(include=['object']):
            df[col] = df[col].apply(normalizar)

        # Quitar duplicados y nulos
        df = df.drop_duplicates().reset_index(drop=True)
        return df

    def limpiar_edad(self, columna = 'edad', rango = (17, 84)):
        #convierte a numerico
        self.dataframe[columna] = pd.to_numeric(self.dataframe[columna], errors='coerce')

        #filtro del rango de edad
        self.dataframe = self.dataframe[
            (self.dataframe[columna].isna()) |
            ((self.dataframe[columna] >= rango[0]) & (self.dataframe[columna] <= rango[1]))
        ]
        return self.dataframe

    # limpieza columnas para la UNION////////////////////////////////////////////////////////////////////////////////////////////
    @staticmethod
    def preparar_datos(df_csv, df_api, df_db1, df_db2):

        # Normalizar año
        df_db1 = df_db1.rename(columns={'anno': 'ano'})
        df_db2 = df_db2.rename(columns={'anno': 'ano'})

        # Normalizar region
        df_csv = df_csv.copy()
        df_csv['region_join'] = df_csv['region_planificacion_estudiante'].str.replace('region_', '', regex=False)
        df_csv['region_join'] = df_csv['region_join'].replace('huetar_caribe', 'huetar_atlantica')
        df_csv = df_csv[~df_csv['region_join'].isin(['sin_informacion', 'no_aplica'])]

        df_api = df_api.rename(columns={'region': 'region_join'})
        df_db1 = df_db1.rename(columns={'region': 'region_join'})

        # Merge CSV y API
        df = df_csv.merge(df_api[['region_join', 'ano', 'porcentaje_pobreza']],
                          on=['region_join', 'ano'], how='left')

        # Merge  DB1 internet
        df = df.merge(df_db1[['region_join', 'ano', 'prom_acceso_internet']],
                      on=['region_join', 'ano'], how='left')

        # ----------------------------------------------------------------

        mapeo_area = {
            'artes_y_letras': 'arte_y_letras',
            'ciencias_de_la_salud': 'salud',
        }
        df['categoria_join'] = df['area_conocimiento'].replace(mapeo_area)

        # Salario por categoria y año
        df_sal_cat = df_db2.groupby(['categoria', 'ano'])['prom_salario'].mean().reset_index()

        # Merge DB2 salario por categoria
        df = df.merge(df_sal_cat,
                      left_on=['categoria_join', 'ano'],
                      right_on=['categoria', 'ano'], how='left')
        print(f"NaN en prom_salario: {df['prom_salario'].isna().sum()} de {len(df)}")
        print(f"Categorías sin match: {df[df['prom_salario'].isna()]['categoria_join'].unique()}")

        return df

    def eliminar_columnas(self):
        columnas_eliminadas = ['sede_conare', 'region_planificacion_sede','region_planificacion_estudiante', 'canton_estudiante','zona_de_urbanizacion_estudiante',
                               'gam_estudiante','gam_sede', 'pais_estudiante', 'continente','nivel_academico', 'nivel_cine','area_unesco', 'disciplina_unesco','categoria_join','carrera','disciplina','area_conocimiento' ]

        self.dataframe = self.dataframe.drop(columns=columnas_eliminadas, errors='ignore').copy()
        return self.dataframe

