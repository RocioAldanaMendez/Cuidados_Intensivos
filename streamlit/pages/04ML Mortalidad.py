#importar librerias
import streamlit as st
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split

# Lectura del archivo CSV en un DataFrame de Pandas
df = pd.read_csv("./Modelo_Datos_Nuevos/df_Mauren_2.csv", low_memory=False)

# Definir la variable objetivo 'sepsis'
df['sepsis'] =  ((df['ritmo_respiratorio'] > 100) & (df['plaquetas'] <20) & (df['bilirrubina'] > 12) & (df['PAM'] < 70) & (df['GCS'] < 6) & (df['creatinina'] > 5) & (df['pO2'] < 200) & (df['charlson_puntaje'] > 3)) 
  

# Seleccionar los signos vitales relevantes
X = df[['ritmo_cardiaco', 'plaquetas', 'bilirrubina', 'PAM', 'GCS', 'creatinina', 'pO2', 'charlson_puntaje']]
y = df['sepsis']

# Dividir los datos en conjuntos de entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Crear y entrenar el modelo de árbol de decisión
model = DecisionTreeClassifier(random_state=42)
model.fit(X_train, y_train)


####### STREAMLIT ####################

# configuración para página centrada
st.set_page_config(layout="centered")

st.title("Predicción de Mortalidad")

ritmo_cardiaco = st.slider("Ritmo cardíaco", min_value=0, max_value=455, value=120)
plaquetas = st.slider("Plaquetas", min_value=0, max_value=200, value=10)
bilirrubina = st.slider("Bilirrubina", min_value=0, max_value=25, value=15)
PAM = st.slider("PAM", min_value=0, max_value=150, value=60)
GCS = st.slider("GCS", min_value=0, max_value=20, value=5)
creatinina = st.slider("Creatinina", min_value=0, max_value=15, value=6)
pO2 = st.slider("pO2", min_value=0, max_value=500, value=10)
charlson_puntaje = st.slider("Puntaje de Charlson", min_value=1, max_value=6, value=10)

# Crear un conjunto de características con los signos vitales del paciente
paciente = [[ritmo_cardiaco, plaquetas, bilirrubina, PAM, GCS, creatinina, pO2, charlson_puntaje]]

# Obtener la predicción del modelo
prediccion = model.predict(paciente)

# Imprimir la predicción
if prediccion == 1:
    st.write("El paciente tiene una taza de mortalidad de entre 10 y 14%")
else:
    st.write("El paciente tiene una taza de mortalidad mayor a 28%")