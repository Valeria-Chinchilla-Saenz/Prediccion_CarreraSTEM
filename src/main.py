from datos.Clase_GestorDatos import *
from api.Clase_ClienteAPI import *
from basedatos.Clase_GestorBaseDatos import *
<<<<<<< Updated upstream
from eda.Clase_ProcesadorEDA import  *
#from modelos.prueba_algoritmos import*
from visualizacion.Clase_Visualizador import Visualizador
#from Prediccion_CarreraSTEM.src.visualizacion.Clase_Visualizador import Visualizador
import matplotlib.pyplot as plt
=======
from eda.limpieza import  *
from modelos.prueba_algoritmos import*
from visualizacion.vizualizador import *
>>>>>>> Stashed changes
import numpy as np
import os
import joblib
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
    #estadisticas
    estadisticos_proyecto = eda.generar_resumen_estadistico()
    comparativa_stem = eda.obtener_comparativa_stem()

    print(f"\nDataset final: {df_final.shape}")
    print("Primeras vistas de las fuentes unidas")
    print(df_final.columns.tolist())
    print(df_final.head())
    print(df_final.dtypes)
    print(df_final.describe())
    print(df_final.isnull().sum())
<<<<<<< Updated upstream

### Clase visualizador
=======
    print("\nEstadísticos Descriptivos")
    print(estadisticos_proyecto['descriptivos'])
    print("\nComparativa: Perfil STEM vs NO STEM")
    if comparativa_stem is not None:
        print(comparativa_stem)
    else:
        print("Advertencia: No se pudo generar la comparativa (Columna 'stem_micitt' no encontrada).")
    print(estadisticos_proyecto['correlacion'])

    print("\n" + "=" * 40)
    print(" Estadísticas procesadas exitosamente ")
    print("=" * 40)

#///////////////////////MODELOS/////////////////////////

#evaluacion de MODELO/////////////////////////////////////////////////////////////////////////////////////
    #x, y
    X, y, le_dict_entrenado = preparar_xy(df_final)
    print(f"X shape: {X.shape}")

    #Reduce la muestra antesde evaluar
    idx = np.random.choice(X.shape[0], 20000, replace=False)
    X_sample, y_sample = X[idx], y[idx]
    print(f"Muestra reducida: {X_sample.shape}")

    #Evaluar con la muestra reducida
    models, results, names = evaluar_modelos(X_sample, y_sample)
    metricas_detalladas(X_sample, y_sample, models)

    print("\nOptimizando los modelos escogidos: LR, KNN, CART ")
    mejor_lr, mejor_knn, mejor_cart = optimizar_modelos(X_sample, y_sample)



    # Evaluar modelos optimizados/////////////////////////////////////////////
    print("\nMetricas de los modelos Optimizados")
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import classification_report, confusion_matrix

    X_train, X_test, y_train, y_test = train_test_split(
        X_sample, y_sample, test_size=0.2, random_state=42, stratify=y_sample)

    for nombre, modelo in [('LR', mejor_lr), ('KNN', mejor_knn), ('CART', mejor_cart)]:
        modelo.fit(X_train, y_train)
        y_pred = modelo.predict(X_test)
        print(f"\n--- {nombre} ---")
        print(classification_report(y_test, y_pred))


#hacer la PRECICCION////////////////////////////////////////////////////////////////
    #modelos entrenados
    modelos_entrenados = {
        '1': mejor_lr,
        '2': mejor_knn,
        '3': mejor_cart
    }

    while True:
        print("\n" + "=" * 30)
        print(" MODULO DE PREDICCIÓN ")
        print("=" * 30)
        print("1. Regresión Logística (LR)")
        print("2. K-Nearest Neighbors (KNN)")
        print("3. Árbol de Decisión (CART)")
        print("4. Salir")

        opcion = input("\nSeleccione un modelo para predecir (1-4): ")

        if opcion == '4':
            print("Finalizando programa...")
            break

        if opcion in modelos_entrenados:

            try:
                resultado = predecir_estudiante(modelos_entrenados[opcion], le_dict_entrenado)
            except Exception as e:
                print(f" Error al realizar la predicción: {e}")
                print("Asegúrese de que le_dict contiene todos los encoders necesarios.")
        else:
            print("Opción no válida.")



### Clase VIZUALIZADOR////////////////////////////////////////////////////////////////////////////////
>>>>>>> Stashed changes
if __name__ == "__main__":

    viz = Visualizador(df_csv_limpio, df_api_limpio, df_db_limpio1, df_db_limpio2)

    print("Mostrando: Evolución de Internet")
    fig_internet = viz.lineal_internet()
    plt.show()

    print("Mostrando: Distribución de Edades")
    fig_edad = viz.histo_distribuccion_edad()
    plt.show()

    print("Mostrando: Matriz de Correlación")
    viz_final = Visualizador(df_final)
    fig_corr = viz_final.heatmap_correlacion()
    plt.show()

<<<<<<< Updated upstream
    print("Mostrando: Evolución de las carreras STEM")
    fig_evolucion = viz.lineal_evolucion()
    plt.show()

    print("Mostrando: Cantidad de estudiantes de acuerdo su tipo de sexo en carreras STEM/No STEM")
    fig_analisis_stem_nostem = viz.barras_analisis_stem_nostem()
    plt.show()

    print("Mostrando: Porcentaje de estudiantes que eligen carreras STEM en zonas urbanas")
    fig_zona_stem = viz.barras_apiladas_zona_stem()
    plt.show()

    #print("Mostrando: Promedio de salarios por categoria de las carreras")
    #fig_salarios = viz.barras_horizontales_salarios(df_final)
    #plt.show()
=======


# DASHBOARD ///////////////////////////////////////////////////////////////////

# Este es un objeto que tiene todo lo que el dashboard ocupa para funcionar
data_export = {
    'modelos': {
        'LR': mejor_lr,
        'KNN': mejor_knn,
        'CART': mejor_cart
    },
    'le_dict': le_dict_entrenado,
    'columnas': ['edad', 'ano', 'porcentaje_pobreza', 'prom_acceso_internet',
                 'sexo', 'tipo_matricula', 'universidad', 'grado_academico',
                 'tipo_nacionalidad', 'zona_urbano_rural_estudiante',
                 'provincia_estudiante', 'region_join', 'rango_salario'],
    'eda_stats': estadisticos_proyecto,
    'eda_comparativa': comparativa_stem
}

joblib.dump(data_export, 'visualizacion/recursos_dashboard.pkl')


#Exportar DF_FINAL///////////////////////////////////////////////////////////////
ruta_salida = "../data/processed/df_final_limpio.csv"

try:
    df_final.to_csv(ruta_salida, index=False, encoding='utf-8')
    print(f"\nArchivo guardado exitosamente en: {ruta_salida}")
except Exception as e:
    print(f"Error al guardar el archivo: {e}")
    print("Asegúrate de que la carpeta 'data/processed' existe en la raíz del proyecto.")
>>>>>>> Stashed changes
