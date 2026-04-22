import pandas as pd
import numpy as np
from sklearn import model_selection
from sklearn.linear_model import LogisticRegression
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import classification_report, confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
from sklearn.model_selection import GridSearchCV
from imblearn.over_sampling import SMOTE
#X, Y /////////////////////////////////////////////////////////////////////////////////////
def preparar_xy(df):
    le_dict = {}
    df_model = df.copy()

    df_model['rango_salario'] = pd.cut(df_model['prom_salario'],
                                       bins=5,
                                       labels=['muy_bajo', 'bajo', 'medio', 'alto', 'muy_alto'])

    cols_numericas = ['edad', 'ano', 'porcentaje_pobreza','prom_acceso_internet']

    cols_categoricas = [    'sexo', 'tipo_matricula', 'universidad', 'grado_academico', 'tipo_nacionalidad',
    'zona_urbano_rural_estudiante', 'provincia_estudiante','region_join','rango_salario']

    df_model = df_model[cols_numericas + cols_categoricas + ['stem_micitt']].copy()
    df_model = df_model.dropna()

    # Encodear categoricas
    le = LabelEncoder()
    for col in cols_categoricas:
        le = LabelEncoder()
        df_model[col] = le.fit_transform(df_model[col].astype(str))
        le_dict[col] = le

     #encodear variable odjetivo
    le_y = LabelEncoder()
    df_model['stem_micitt'] = le_y.fit_transform(df_model['stem_micitt'].astype(str))
    le_dict['stem_micitt'] = le_y


    X = df_model[cols_numericas + cols_categoricas].values
    y = df_model['stem_micitt'].values

    print(f"Dataset original (0: {le_y.classes_[0]}, 1: {le_y.classes_[1]}): {np.bincount(y)}")
#libreria SMOTE
    try:
        smote = SMOTE(random_state=42)
        X_res, y_res = smote.fit_resample(X, y)
        print(f"Dataset balanceado: {np.bincount(y_res)}")
    except Exception as e:
        print(f"No se pudo aplicar SMOTE (posiblemente pocos datos): {e}")
        X_res, y_res = X, y

    return X, y, le_dict

# IMPORTANCIA////////////////////////////////////////////////////////////////////////////////////////////////////////////
def mostrar_importancia(modelo, nombres_cols):
    # Si el modelo está dentro de un Pipeline (como tus LR o KNN)
    # necesitamos extraer el paso del clasificador
    if hasattr(modelo, 'named_steps'):
        m = modelo.named_steps[list(modelo.named_steps.keys())[-1]]
    else:
        m = modelo

    importancias = None
    if hasattr(m, 'feature_importances_'):
        importancias = m.feature_importances_
    elif hasattr(m, 'coef_'):
        importancias = np.abs(m.coef_[0])

    if importancias is not None:
        df_imp = pd.DataFrame({'Variable': nombres_cols, 'Importancia': importancias})
        df_imp = df_imp.sort_values(by='Importancia', ascending=False)

        plt.figure(figsize=(10, 6))
        sns.barplot(x='Importancia', y='Variable', data=df_imp, palette='viridis')
        plt.title('Importancia de Variables en la Predicción')
        plt.tight_layout()
        plt.show()

#Evaluacion de algoritmos////////////////////////////////////////////////////////////////////////////////

def evaluar_modelos(X, y):
    models = [
        # Agrega scaler a LR y SVM que son sensibles a la escala
        ('LR',   make_pipeline(StandardScaler(), LogisticRegression(max_iter=3000))),
        ('LDA',  LinearDiscriminantAnalysis()),
        ('KNN',  make_pipeline(StandardScaler(), KNeighborsClassifier())),
        ('CART', DecisionTreeClassifier(max_depth=10, min_samples_leaf=20)),
        ('NB',   GaussianNB()),
        #('SVM',  make_pipeline(StandardScaler(), SVC(max_iter=3000))),
    ]

    results, names = [], []
    print("\nComparacion de los Modelos")
    for name, model in models:
        kfold = model_selection.KFold(n_splits=10, random_state=42, shuffle=True)
        cv_results = model_selection.cross_val_score(model, X, y, cv=kfold, scoring='accuracy')
        results.append(cv_results)
        names.append(name)
        print(f"{name}: accuracy={cv_results.mean():.4f}  std={cv_results.std():.4f}")

    #boxplot comparación
    plt.figure(figsize=(10, 5))
    plt.boxplot(results, labels=names)
    plt.title('Comparación de Algoritmos - Accuracy (CV 10-fold)')
    plt.ylabel('Accuracy')
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.show()

    return models, results, names

#METRICAS DE LOS MODELOS//////////////////////////////////////////////////////////////////
def metricas_detalladas(X, y, models):
    from sklearn.model_selection import train_test_split

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

    print("\nMetricas detalladas por Modelo")
    for name, model in models:
        model.fit(X_train, y_train)
        y_pred = model.predict(X_test)
        print(f"\n--- {name} ---")
        print(classification_report(y_test, y_pred))

        # Matriz de confusión por modelo
        cm = confusion_matrix(y_test, y_pred)
        plt.figure(figsize=(5, 4))
        sns.heatmap(cm, annot=True, fmt='d', cmap='Blues')
        plt.title(f'Matriz de Confusion - {name}')
        plt.ylabel('Real')
        plt.xlabel('Predicho')
        plt.tight_layout()
        plt.show()


#OPTIMIZACION/////////////////////////////////////////////////////////////////////
def optimizar_modelos(X, y):
    #LR
    param_lr = {
        # regularizacion: menor=mas simple, mayor=mas complejo
        'logisticregression__C':      [0.001, 0.01, 0.1, 1, 10],
        # algoritmo_optimizacion
        'logisticregression__solver': ['lbfgs', 'saga'],
        # maximo_iteraciones
        'logisticregression__max_iter': [1000, 3000]
    }
    lr = make_pipeline(StandardScaler(), LogisticRegression())
    grid_lr = GridSearchCV(lr, param_lr, cv=5, scoring='accuracy', n_jobs=-1)
    grid_lr.fit(X, y)
    print("\nPara LR:")
    print("Mejores parametros:", grid_lr.best_params_)
    print("Mejor accuracy:", grid_lr.best_score_)

    #KNN
    param_knn = {
        # numero_vecinos: cuantos vecinos consulta
        'kneighborsclassifier__n_neighbors': [3, 5, 7, 11, 15],
        # pesos: uniforme=todos iguales, distance=mas cerca mas peso
        'kneighborsclassifier__weights':     ['uniform', 'distance'],
        # distancia: euclidiana o manhattan
        'kneighborsclassifier__metric':      ['euclidean', 'manhattan']
    }
    knn = make_pipeline(StandardScaler(), KNeighborsClassifier())
    grid_knn = GridSearchCV(knn, param_knn, cv=5, scoring='accuracy', n_jobs=-1)
    grid_knn.fit(X, y)
    print("\nPara KNN:")
    print("Mejores parámetros:", grid_knn.best_params_)
    print("Mejor accuracy:", grid_knn.best_score_)

    #CART
    param_cart = {
        # profundidad_maxima
        'max_depth':         [5, 10, 15, 20],
        # minimo_muestras_hoja
        'min_samples_leaf':  [10, 20, 50],
        # minimo_muestras_division
        'min_samples_split': [2, 10, 20],
        # criterio
        'criterion': ['gini', 'entropy']
    }
    cart = DecisionTreeClassifier()
    grid_cart = GridSearchCV(cart, param_cart, cv=5, scoring='accuracy', n_jobs=-1)
    grid_cart.fit(X, y)
    print("\nPara CART:")
    print("Mejores parametros:", grid_cart.best_params_)
    print("Mejor accuracy:", grid_cart.best_score_)

    return grid_lr.best_estimator_, grid_knn.best_estimator_, grid_cart.best_estimator_


# NUEVOS REGISTROS////////////////////////////////////////////////////////////////////////////////////////////
def predecir_estudiante(modelo, le_dict):
    print("\nPrediccion de tipo de carrera para nuevos Estudiantes")
    print("Ingrese los datos del estudiante:\n")

    #Datos numericos
    edad = float(input("Edad: "))
    ano  = int(input("Año actual: "))
    if ano > 2022:
        print("Predicción basada en comportamiento historico 2019-2022")

    #Datos categoricos
    #sexo
    print("\nSexo:", le_dict['sexo'].classes_)
    sexo = input("Sexo: ").strip().lower().replace(" ", "_")

    #maticula
    print("Aspirante a:", le_dict['tipo_matricula'].classes_)
    tipo_matricula = input("Tipo matrícula: ").strip().lower().replace(" ", "_")
    #universidad
    print("Universidad Estatal en la que aspira a ingresar:", le_dict['universidad'].classes_)
    universidad = input("Universidad: ").strip().lower().replace(" ", "_")
    #grado
    print("Grado académico que aspira alcanzar:", le_dict['grado_academico'].classes_)
    grado_academico = input("Grado académico: ").strip().lower().replace(" ", "_")
    #nacionalidad
    print("Tipo nacionalidad :", le_dict['tipo_nacionalidad'].classes_)
    tipo_nacionalidad = input("Tipo nacionalidad: ").strip().lower().replace(" ", "_")
    #zona
    print("Tipo de zona donde reside:", le_dict['zona_urbano_rural_estudiante'].classes_)
    zona = input("Zona urbano/rural: ").strip().lower().replace(" ", "_")
    #provincia
    print("Provincia:", le_dict['provincia_estudiante'].classes_)
    provincia = input("Provincia: ").strip().lower().replace(" ", "_")
    #region
    print("Region:", le_dict['region_join'].classes_)
    region = input("Región: ").strip().lower().replace(" ", "_")
    #salario
    print("Rango salario:", le_dict['rango_salario'].classes_)
    rango_salario = input("Rango salario esperado: ").strip().lower().replace(" ", "_")

    #Pobreza basada en region
    print("\n¿Cuál es su condición economica?")
    print("  1. Clase alta")
    print("  2. Clase media-alta")
    print("  3. Clase media")
    print("  4. Clase media-baja")
    print("  5. Clase baja")
    condicion = int(input("Seleccione una opcion (1-5): "))

    promedios_pobreza = {
        'central':          [10, 20, 31, 40, 55],
        'chorotega':        [15, 25, 38, 50, 65],
        'pacifico_central': [15, 25, 37, 48, 62],
        'brunca':           [18, 28, 40, 52, 68],
        'huetar_norte':     [16, 26, 39, 51, 65],
        'huetar_atlantica': [14, 24, 36, 48, 63],
    }
    porcentaje_pobreza = promedios_pobreza.get(region, [15, 25, 35, 50, 65])[condicion - 1]
    print(f"  → Porcentaje de pobreza estimado: {porcentaje_pobreza}%")

    #Internet basado en region
    print("\n¿Cuenta con acceso a internet en su hogar?")
    print("  1. Si, acceso rapido y estable")
    print("  2. Si, pero lento o intermitente")
    print("  3. No tengo internet en casa")
    acceso = int(input("Seleccione una opcion (1-3): "))

    promedios_internet = {
        'central':          [23.0, 19.0, 10.0],
        'chorotega':        [20.0, 15.0,  8.0],
        'pacifico_central': [21.0, 16.0,  9.0],
        'brunca':           [18.0, 13.0,  6.0],
        'huetar_norte':     [19.0, 14.0,  7.0],
        'huetar_atlantica': [17.0, 12.0,  6.0],
    }
    prom_acceso_internet = promedios_internet.get(region, [20.0, 15.0, 8.0])[acceso - 1]
    print(f"  → Promedio de acceso a internet estimado: {prom_acceso_internet}")

    # Construir fila
    cols_numericas   = ['edad', 'ano', 'porcentaje_pobreza', 'prom_acceso_internet']
    cols_categoricas = ['sexo', 'tipo_matricula', 'universidad', 'grado_academico',
                        'tipo_nacionalidad', 'zona_urbano_rural_estudiante',
                        'provincia_estudiante', 'region_join', 'rango_salario']

    valores_num = [edad, ano, porcentaje_pobreza, prom_acceso_internet]
    valores_cat = [sexo, tipo_matricula, universidad, grado_academico,
                   tipo_nacionalidad, zona, provincia, region, rango_salario]

    fila = valores_num.copy()
    for col, val in zip(cols_categoricas, valores_cat):
        if val in le_dict[col].classes_:
            fila.append(le_dict[col].transform([val])[0])
        else:
            print(f"'{val}' no reconocido en '{col}', usando valor por defecto.")
            fila.append(0)

    #Predecir
    X_nuevo = np.array(fila).reshape(1, -1)
    pred_num = modelo.predict(X_nuevo)[0]

    try:
        resultado_texto = le_dict['stem_micitt'].inverse_transform([pred_num])[0]
    except:
        # Por si algo falla, que al menos muestre el número
        resultado_texto = str(pred_num)

    print(f"\n{'=' * 40}")
    print(f"  Resultado de la prediccion: {resultado_texto.upper()}")
    print(f"{'=' * 40}")


    if hasattr(modelo, 'predict_proba'):
        probabilidades = modelo.predict_proba(X_nuevo)[0]
        clases_originales = le_dict['stem_micitt'].classes_
        for clase, prob in zip(clases_originales, probabilidades):
            barra = '█' * int(prob * 20)
            print(f"  {clase:<10} {barra} {prob*100:.1f}%")

    nombres_columnas = cols_numericas + cols_categoricas
    print("\nGenerando análisis de importancia de variables...")
    mostrar_importancia(modelo, nombres_columnas)

    return resultado_texto