import pandas as pd
import numpy as np
import glob
from sqlalchemy import create_engine
import os
path_other = '/opt/airflow/dags/datasets/base/' # ruta de donde se toman los archivos desde aws

## Funcion para importar el documento desde aws
def FileImporter (name: str, tipo: str, spacer:str = ',', path:str = path_other, encoding:str = 'utf-8'):

    
    # Arroja un error si el tipo de documento no esta declarado
    if tipo == '':
        raise ValueError ('Necesitas definir una extension a tu documento')

    
    #Setear la ruta del documento y la extensión
    file = path + name + '.' + tipo
    
    #Error
    #Imprimir archivo
    
    try:
        #CSV con cod
        if tipo == 'csv':
            try:
                df = pd.read_csv(file, sep=spacer, encoding=encoding, low_memory=False)
                return df
            except UnicodeDecodeError as e:
                print('Intenta otro tipo de encoding diferente para tu archivo', e)

    except FileNotFoundError as f:
        print('Error de lectura de archivo' + str(f))

    finally:
        print('Importación exitosa para el archivo ', file)

## Funcion que realiza el etl del archivo        

def Clean_Chartevents(df):

    # Convertir los valores 'nan' a nulos
    df['valuenum'] = df['valuenum'].apply(lambda x: None if x == 'nan' else x)

    # Ejecutar la primera consulta
    df.loc[df['valuenum'].isna(), 'valuenum'] = None

    # Ejecutar la segunda consulta
    df.loc[df['valuenum'].notna(), 'valuenum'] = 2222

    # Ejecutar la tercera consulta
    df.loc[(df['valuenum'] < -9999999999.9999999999) | (df['valuenum'] > 9999999999.9999999999), 'valuenum'] = None

    # Ejecutar la cuarta consulta
    df.loc[df['icustay_id'].notna() & df['icustay_id'].astype(str).str.match('^[0-9]+$'), 'icustay_id'] = df['icustay_id'].astype(float).astype('Int64')

    # Manejar los valores faltantes en icustay_id antes de convertir a int
    df.loc[df['icustay_id'].isna() | (df['icustay_id'] == ''), 'icustay_id'] = None

    # Ejecutar la quinta consulta
    df.loc[df['icustay_id'].isna(), 'icustay_id'] = 2222

    # Ejecutar la sexta consulta
    df.loc[(df['warning'] < -9999999999.9999999999) | (df['warning'] > 9999999999.9999999999), 'warning'] = None

    # Ejecutar la séptima consulta
    df.loc[df['warning'].isna(), 'warning'] = None

    # Ejecutar la octava consulta
    df.loc[df['warning'].notna(), 'warning'] = 2222

    # Ejecutar la novena consulta
    df.loc[(df['warning'] < -9999999999.9999999999) | (df['warning'] > 9999999999.9999999999), 'warning'] = None

    # Ejecutar la décima consulta
    df.loc[(df['error'] < -9999999999.9999999999) | (df['error'] > 9999999999.9999999999), 'error'] = None

    # Ejecutar la onceava consulta
    df.loc[df['error'].notna(), 'error'] = 2222

    return df



from sqlalchemy import create_engine


## Crea conexion con mysql 
engine = create_engine('mysql://root:rola2801@localhost/prueba_chartevents')
## exporta la tabla
df.to_sql('chartevents', con=engine, if_exists='append', index=False)

