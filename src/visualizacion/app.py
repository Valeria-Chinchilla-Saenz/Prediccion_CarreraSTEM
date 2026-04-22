import streamlit as st
import pandas as pd
import numpy as np
import joblib
import plotly.express as px

# Configuracion de la pagina
st.set_page_config(page_title="Dashboard Prediccion STEM", layout="wide")


# Carga de recursos del modelo
@st.cache_resource
def cargar_recursos():
    # El archivo recursos_dashboard.pkl
    return joblib.load('recursos_dashboard.pkl')
#sssss


# Menu lateral de navegacion////////////////////////////////////////////
with st.sidebar:
    st.title("Menu de Navegacion")
    seleccion = st.radio(
        "Ir a:",
        ["Analisis Exploratorio (EDA)", "Modulo de Prediccion"]
    )
# Seccion 1 = EDA////////////////////////////////////////////////////////////////////////
if seleccion == "Analisis Exploratorio (EDA)":
    st.header("Analisis Exploratorio de Datos")


    # Intentamos cargar el CSV que exportamos en el paso anterior
    @st.cache_data
    def cargar_datos_finales():
        try:
            # Ruta relativa desde src/visualizacion/app.py hacia data/processed/
            return pd.read_csv('../../data/processed/df_final_limpio.csv')
        except:
            return None


    df = cargar_datos_finales()

    if df is not None:
        from vizualizador import Visualizador

        viz = Visualizador(df)

        col1, col2 = st.columns(2)

        with col1:
            st.subheader("Evolucion de Acceso a Internet")
            #lineal_internet()
            fig_internet = viz.lineal_internet()
            st.plotly_chart(fig_internet, use_container_width=True)

            st.subheader("Distribucion de Edades")
            # histo_distribuccion_edad()
            fig_edad = viz.histo_distribuccion_edad()
            st.plotly_chart(fig_edad, use_container_width=True)

        with col2:
            st.subheader("Matriz de Correlacion")
            #heatmap_correlacion()
            fig_corr = viz.heatmap_correlacion()
            st.plotly_chart(fig_corr, use_container_width=True)

            st.subheader("Comparativa STEM por Genero")
            # Grafico extra
            fig_sexo = px.histogram(df, x='sexo', color='stem_micitt', barmode='group',
                                    color_discrete_sequence=px.colors.qualitative.Safe)
            st.plotly_chart(fig_sexo, use_container_width=True)

        # Estadisticos
        st.divider()
        st.subheader("Resumen Estadistico de Variables Clave")
        st.dataframe(df[['edad', 'porcentaje_pobreza', 'prom_acceso_internet', 'prom_salario']].describe().T,
                     use_container_width=True)

    else:
        st.error("No se pudo cargar el archivo 'df_final_limpio.csv' desde data/processed. Verifique la ruta.")
# Seccion 2= Prediccion//////////////////////////////////////////////////////////////////
elif seleccion == "Modulo de Prediccion":
    recursos = cargar_recursos()
    modelos = recursos['modelos']
    le_dict = recursos['le_dict']
    nombres_cols = recursos['columnas']

    st.header("Modulo de Prediccion")

    with st.sidebar:
        st.subheader("Ajustes del Modelo")
        algoritmo = st.selectbox("Seleccionar Algoritmo", list(modelos.keys()))
        modelo_act = modelos[algoritmo]

    with st.form("formulario_prediccion"):
        c1, c2, c3 = st.columns(3)

        with c1:
            edad = st.number_input("Edad", 15, 75, 20)
            ano = st.number_input("Anio", 2019, 2030, 2026)
            sexo = st.selectbox("Sexo", le_dict['sexo'].classes_)
            nacionalidad = st.selectbox("Nacionalidad", le_dict['tipo_nacionalidad'].classes_)

        with c2:
            universidad = st.selectbox("Universidad", le_dict['universidad'].classes_)
            grado = st.selectbox("Grado Academico", le_dict['grado_academico'].classes_)
            matricula = st.selectbox("Tipo Matricula", le_dict['tipo_matricula'].classes_)
            zona = st.selectbox("Zona", le_dict['zona_urbano_rural_estudiante'].classes_)

        with c3:
            provincia = st.selectbox("Provincia", le_dict['provincia_estudiante'].classes_)
            region = st.selectbox("Region", le_dict['region_join'].classes_)
            salario = st.selectbox("Rango Salarial", le_dict['rango_salario'].classes_)
            pobreza = st.slider("Porcentaje Pobreza", 0, 100, 30)
            internet = st.slider("Acceso Internet", 0.0, 30.0, 15.0)

        enviar = st.form_submit_button("Realizar Prediccion")

    if enviar:
        # Preparacion de datos de entrada
        inputs_cat = {
            'sexo': sexo, 'tipo_matricula': matricula, 'universidad': universidad,
            'grado_academico': grado, 'tipo_nacionalidad': nacionalidad,
            'zona_urbano_rural_estudiante': zona, 'provincia_estudiante': provincia,
            'region_join': region, 'rango_salario': salario
        }

        fila = [edad, ano, pobreza, internet]
        for col in nombres_cols[4:]:
            val_t = inputs_cat[col]
            fila.append(le_dict[col].transform([val_t])[0])

        X_nuevo = np.array(fila).reshape(1, -1)

        # Ejecucion de prediccion
        pred_num = modelo_act.predict(X_nuevo)[0]
        resultado = le_dict['stem_micitt'].inverse_transform([pred_num])[0]

        st.divider()
        res_col, imp_col = st.columns([1, 2])

        with res_col:
            st.subheader("Resultado")
            st.metric("Carrera Predicha", resultado.upper())
            if hasattr(modelo_act, "predict_proba"):
                probabilidades = modelo_act.predict_proba(X_nuevo)[0]
                df_prob = pd.DataFrame({
                    'Clase': le_dict['stem_micitt'].classes_,
                    'Probabilidad': probabilidades
                })
                fig_prob = px.bar(df_prob, x='Clase', y='Probabilidad', range_y=[0, 1])
                st.plotly_chart(fig_prob, use_container_width=True)

        with imp_col:
            st.subheader("Importancia de las Variables")
            # Extraer importancia del modelo o del pipeline
            m_interno = modelo_act.named_steps[list(modelo_act.named_steps.keys())[-1]] if hasattr(modelo_act,
                                                                                                   'named_steps') else modelo_act

            if hasattr(m_interno, 'feature_importances_'):
                imp_vals = m_interno.feature_importances_
                df_imp = pd.DataFrame({'Variable': nombres_cols, 'Importancia': imp_vals}).sort_values('Importancia',
                                                                                                       ascending=True)
                fig_imp = px.bar(df_imp, x='Importancia', y='Variable', orientation='h')
                st.plotly_chart(fig_imp, use_container_width=True)
            else:
                st.info("La importancia de variables no esta disponible para este modelo.")