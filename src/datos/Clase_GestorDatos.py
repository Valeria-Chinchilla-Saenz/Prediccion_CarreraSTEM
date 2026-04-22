import pandas as pd

#CSV//////////////////////////////////////////////////////////////////////////
class carga_csv:
    def __init__(self, archivo):
        self.archivo = archivo
        self.df_csv = self.car_csv(archivo)
#**************************************************
    @staticmethod
    def car_csv(archivo):
        try:
            return pd.read_csv(f"{archivo}.csv", sep=',', encoding='utf-8-sig')
        except Exception as e:
            print(f"Error al cargar CSV: {e}")
            return None
