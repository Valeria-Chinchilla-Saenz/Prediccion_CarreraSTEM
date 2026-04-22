# Prediccion_CarreraSTEM
Proyecto de ciencia de datos enfocado en la predicción de estudiantes que optan por carreras STEM según su zona geográfica y demográfica.


### Estructura del proyecto
scr/datos: contiene los scripts encargados de la carga inicial, limpieza de transformaciones básicas.

scr/basedatos: gestiona la conexión con el motor SQL Server Management.

scr/api: realiza peticiones a la API, coosume los datos y los convierte en un dataframe.

scr/eda: realiza el analisis estadistico inicial, limpieza profunda y detección de irregularidades en los datos.

scr/visualizacion: crea las visualizaciones del proyecto.

scr/modelos: contiene la lógica para entender, probar y evaluar modelos machine learning.

scr/helpers: contiene funciones auxiliares para tareas repetitivas.

notebooks/exploracion_inicial: contiene la presentación interactiva con el analisis visual y la explicación.

data/raw: almacena los archivos originales en crudo.

data/processed: alamcena los archivos ya procesados y limpios.


Descripción: Identificar estudiantes que podrían optar por una carrera STEM según su demografía, Geografía para identificar y reducir brechas de acceso.


Fuentes de Datos  

csv: BD_Matrícula_Sector_Estatal_2021_2024, BD_Matrícula_Sector_Estatal_2019_2020,
	aqui unimos ambos csvs y solo usamos los años del 2019 al 2022.

API:  de cepalstat https://api-cepalstat.cepal.org/cepalstat/api/v1/indicator/4688/data?lang=es&format=json&in=188 
para los índices de pobreza por región.

Códigos de las regiones para la API
               "84457": "Chorotega",
                "84446": "Central",
                "84452": "Brunca",
                "84453": "Huetar Atlántica",
                "84456": "Huetar Norte",
                "84461": "Pacífico Central"
Códigos de los años en que se va a filtrar lo los datos 
               "29191": 2019,
                "29192": 2020,
                "29193": 2021,
                "29194": 2022,
                "29195": 2023

Base de datos: creada, recopila el promedio de salario por carrera del 2019-2022 (la información de el salario es publicada cada 4 años por la fuente por lo que ) y el índice promedio de acceso a internet por región del 2019 a 2022.

Promedio de salario por carrera :https://radiografia.conare.ac.cr/
Acceso a internet por región:


Variables:
Variable objetivo: STEM_MICITT (Binaria) 

variables de entrada: 
	csv: SEXO,EDAD, PROVINCIA_ESTUDIANTE, ZONA_DE URBANIZACION_ESTUDIANTE,ZONA_URBANO_RURAL_ESTUDIANTE,CANTON_ESTUDIANTE,GAM_ESTUDIANTE,PROVINCIA_ESTUDIANTE,UNIVERSIDAD,TIPO_NACIONALIDAD,REGION_PLANIFICACION_SEDE,SEDE_CONARE,DISCIPLINA,AREA_CONOCIMIENTO,GRADO_ACADEMICO,TIPO_MATRICULA,PAIS_ESTUDIANTE,AÑO

API: Índices de pobreza por región


BD: Promedio de salario por carrera, Acceso a internet por región





