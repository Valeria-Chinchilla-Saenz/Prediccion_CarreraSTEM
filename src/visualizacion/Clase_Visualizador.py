import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import plotly.express as px
import numpy as np

class Visualizador:
    def __init__(self, df_csv, df_api=None, df_db1=None, df_db2=None, df_final=None):
        self.df_csv = df_csv
        self.df_api = df_api
        self.df_db1 = df_db1
        self.df_db2 = df_db2
        self.df_final = df_final
        sns.set_style("whitegrid")

# Gráficos de líneas

    #Grafico de lineas que muestra la tendendencia de estudiantes STEM por region
    def lineal_evolucion(self):
        def_temp = self.df_csv.copy()

        #filtra unicamente las carreras STEM
        def_temp = def_temp[def_temp['stem_micitt'] == 'stem']

        # Filtra para eliminar las filas con zonas no válidas
        def_temp = def_temp[
            ~def_temp['zona_de_urbanizacion_estudiante'].isin(['sin_informacion', 'no_aplica'])
        ]

        #agrupa por año y zona urbanación del estudiante
        promedio_zonaurb = (def_temp.groupby(['ano', 'zona_de_urbanizacion_estudiante']).size().unstack(fill_value = 0))

        #filtro para eliminar los datos que sean sin informacion y no aplica
        columnas_excluir = ['sin_informacion', 'no_aplica']
        promedio_zonaurb = promedio_zonaurb.drop(columns=columnas_excluir, errors='ignore')

        fig, ax = plt.subplots(figsize = (12,6))

        # Dibujar una línea por cada zona
        for zona in promedio_zonaurb.columns:
            ax.plot(promedio_zonaurb.index, promedio_zonaurb[zona],
                    marker='o', linestyle='-', markersize=5, label=zona)

        ax.set_title('Tendencia de estudiantes STEM por zona urbanizacion (2019-2022)')
        ax.set_xlabel('Año')
        ax.set_ylabel('Cantidad de estudiante STEM')
        ax.legend()
        ax.grid(True, linestyle='--', alpha=0.7)

        plt.tight_layout()
        return fig

    #Grafico de lineas que muestra la evolución del internet en el tiempo
    def lineal_internet(self):

        #transforma los datos
        df_pivote = self.df_db1.pivot(index = 'anno', columns = 'region', values = 'prom_acceso_internet')

        fig, ax = plt.subplots(figsize=(10,6))
        ax = (df_pivote.plot(kind = 'line', ax = ax, marker = 's', markersize = 6))

        ax.set_title('Evolución a acceso a Internet por región de Costa Rica')
        ax.set_xlabel('Anno (2019-2022)')
        ax.set_ylabel('Promedio de Acceso')

        plt.xticks(df_pivote.index) #verifica que los años del eje x sean exactos
        ax.legend()
        ax.grid(True, linestyle = '--', alpha = 0.7)

        plt.tight_layout()
        return fig


#Graficos de barras

    # Grafico de barras agrupadas que compara la cantidad de estudiantes STEM y no STEM
    # por su tipo de sexo
    def barras_analisis_stem_nostem(self):

        #tabla de agrupacion: agrupa el "sexo" en las filas y "stem_micitt" en las columnas
        tabla_conteo = pd.crosstab(self.df_csv['sexo'], self.df_csv['stem_micitt'])

        ax = tabla_conteo.plot(kind = 'bar', figsize = (10,6), width = 0.7, color = ['#f8766d', '#00bfc4'])
        fig = ax.figure

        ax.set_title('Comparación de los estudiantes matriculados en áreas stem/no stem según su sexo')
        ax.set_xlabel('Sexo')
        ax.set_ylabel('Cantidad de estudiantes')

       #rota las etiquetas del eje x
        plt.xticks(rotation = 0)

        #añade una leyenda para identificar que color es stem y cuál no stem
        ax.legend(title = 'Categoría STEM', labels=['No STEM', 'STEM'])

        plt.tight_layout()
        return fig

    #Grafico de barras apiladas que muestra el procentaje de los estudiantes que eligen carreras STEM
    #comparado con los urbanos
    def barras_apiladas_zona_stem(self):
        df_filtrado = self.df_csv[
            ~self.df_csv['zona_urbano_rural_estudiante'].isin(['sin_informacion', 'no_aplica'])
        ]

        tabla = pd.crosstab(df_filtrado['zona_urbano_rural_estudiante'], df_filtrado['stem_micitt'])

        tabla_porcentaje = tabla.div(tabla.sum(1).astype(float), axis=0)

        fig,ax = plt.subplots(figsize=(10,6))
        tabla_porcentaje.plot(kind = 'bar', stacked = True,ax = ax)

        ax.title.set_text('Proporción de estudiantes en áreas STEM')
        ax.set_xlabel('Zona de residencia')
        ax.set_ylabel('Porcentaje de estudiantes')

        plt.xticks(rotation = 0)

        #Ajuste de la leyenda para no tapar el gráfico
        ax.legend(title = 'Categoria STEM', labels=['No STEM', 'STEM'], bbox_to_anchor = (1.05, 1), loc = 'upper left')

        plt.tight_layout()
        return fig