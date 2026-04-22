import pandas as pd
import requests

#API////////////////////////////////////////////////////////////////////
class carga_api:
    def __init__(self, url):
        self.url = url
        self.df_api = self.car_api(url)
#********************************************************
    @staticmethod
    def car_api(url):
        try:
            print("Conectando a la API...")
            response = requests.get(url, timeout=10)
            if response.status_code == 200:
                print("Datos obtenidos exitosamente.")
                data = response.json().get('body', {}).get('data', [])
                df = pd.DataFrame(data)

                # Diccionarios de mapeo originales
                regiones_cr = {
                    "84457": "Chorotega", "84446": "Central", "84452": "Brunca",
                    "84453": "Huetar Atlantica", "84456": "Huetar Norte", "84461": "Pacífico Central"
                }
                annos_map = {
                    "29191": 2019, "29192": 2020, "29193": 2021, "29194": 2022, "29195": 2023
                }

                # Filtrado y Mapeo
                df = df[df['dim_84443'].astype(str).isin(regiones_cr.keys())].copy()
                df['Region'] = df['dim_84443'].astype(str).map(regiones_cr)
                df['Año'] = df['dim_29117'].astype(str).map(annos_map)
                df['Porcentaje_Pobreza'] = pd.to_numeric(df['value'], errors='coerce')

                # Seleccion de columnas
                df_final = df.dropna(subset=['Año']).copy()
                df_final['Año'] = df_final['Año'].astype(int)
                df_final = df_final[['Region', 'Año', 'Porcentaje_Pobreza']]

                return df_final
        except Exception as e:
            print(f"Error en API: {e}")
            return None