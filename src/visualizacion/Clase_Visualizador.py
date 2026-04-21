import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import plotly.express as px
import numpy as np

class Visualizador:
    def __init__(self, dataframe):
        self.dataframe = dataframe
        sns.set_style("whitegrid")


# Gráficos de líneas

    #Grafico de lineas que muestra la tendendencia de estudiantes STEM por region
    def lineal_evolucion(self):
        def_temp = self.dataframe.copy()

        #filtra unicamente las carreras STEM
        def_temp = [def_temp['STEM_MICITT'] == 'STEM']

        #agrupa por año y zona urbanación del estudiante
        promedio_zonaurb = def_temp.groupby(['AÑO', 'ZONA_URBANIZACION_ESTUDIANTE']).mean().sort_index()

        fig, ax = plt.subplots(12,6)

        #dibujar linea por zona urbanizacion
        ax.plot(promedio_zonaurb, promedio_zonaurb['zona_urbanizacion_estudiante'],
                marker='o', linestyle='-', markersize=5, label='zona urbanizacion')

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
        df_pivote = self.dataframe.pivot(index = 'anno', columns = 'region', values = 'prom_acceso_internet')

        fig, ax = plt.subplots(figsize=(10,6))
        ax = (df_pivote.plot(kind = 'line', ax = ax, maker = 's', markersize = 6))

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
        tabla_conteo = pd.crosstab(self.dataframe['sexo'], self.dataframe['stem_micitt'])
        fig, ax = tabla_conteo.plot(kind = 'bar', figsize = (10,6), width = 0.7, color = ['#f8766d', '#00bfc4'])

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
        tabla = pd.crosstab(self.dataframe['zona_urbano_rural_estudiante'], self.dataframe['stem_micitt'])

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

    #Grafico de barras horizontales que muestran el promedio de salario por categoria de las carreras
    def barras_horizontales_salarios(self):

        df_salarios = self.dataframe.groupby('categoria')['prom_salario'].mean().sort_values(ascending = True)

        fig, ax = plt.subplots(figsize=(10,6))

        #dibujo de las barras horrizontales
        colores = sns.color_palette("viridis", n_colors=len(df_salarios))
        ax.barh(df_salarios.index, df_salarios, color= colores)

        #cuadricula en el eje x para facilitar la comparación de valores
        ax.grid(axis = 'x', linestyle = '--', alpha = 0.7)

        fig.tight_layout()
        return fig



#Histograma
    #Histograma que muestra la distribución de edad de los estudiantes
    def histo_distribuccion_edad(self):

        #figura
        fig, ax = plt.subplots(figsize=(10,6))
        #dibuja el histograma
        sns.hisplot(self.dataframe['edad'], bins = 15, kde = True, color = 'skyblue', alpha = 0.7, ax = ax)

        ax.set_title('Distribucción de edades de los estudiante')
        ax.set_xlabel('Edad')
        ax.set_ylabel('Cantidad de estudiantes')

        ax.grid(axis = 'y', linestyle = '--', alpha = 0.7)

        plt.tight_layout()
        return fig