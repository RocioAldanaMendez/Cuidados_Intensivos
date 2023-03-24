import pandas as pd
import pickle
import gradio as gr
import sklearn

# Cargar el modelo desde un archivo
with open('sepsis_model_refinado.pkl', 'rb') as archivo:
    modelo = pickle.load(archivo)

def predict_sepsis(ritmo_cardiaco, plaquetas, bilirrubina, PAM, GCS, creatinina, pO2):
    """
    Esta función clasifica si un paciente tiene sepsis o no en base a los valores
    de sus signos vitales: ritmo cardíaco, GCS y PAS.
    
    Args:
    - ritmo_cardiaco (float): Ritmo cardíaco del paciente.
    - GCS (float): Escala de Coma de Glasgow (GCS, por sus siglas en inglés) del paciente.
    - PAS (float): Presión arterial sistólica (PAS) del paciente.
    
    Returns:
    - str: Cadena que indica si el paciente tiene sepsis ('Sí') o no ('No').
    """
    # Crear un DataFrame con los valores de los signos vitales
    data = pd.DataFrame({"ritmo_cardiaco": [ritmo_cardiaco],
                         "plaquetas":[plaquetas],
                         "bilirrubina":[bilirrubina],
                         "PAM":[PAM],
                         "GCS": [GCS],
                         "creatinina":[creatinina],
                         "pO2": [pO2]})
    
    # Hacer la predicción de sepsis
    pred = modelo.predict(data)[0]
    
    # Retornar la cadena correspondiente
    if pred == 0:
        return "Negativo"
    else:
        return "Positivo"

# Crear la interfaz de Gradio
inputs = [gr.inputs.Number(label="ritmo_cardiaco"),
          gr.inputs.Number(label="plaquetas"),
          gr.inputs.Number(label="bilirrubina"),
          gr.inputs.Number(label="PAM"),
          gr.inputs.Number(label="GCS"),
          gr.inputs.Number(label="creatinina"),
          gr.inputs.Number(label="pO2")]


output = gr.outputs.Textbox(label="Sepsis")

gr.Interface(fn=predict_sepsis, inputs=inputs, outputs=output).launch()