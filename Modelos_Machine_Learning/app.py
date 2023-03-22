import pandas as pd
import pickle
import gradio as gr
import sklearn

# Cargar el modelo desde un archivo
with open(r'C:\Users\rocio\OneDrive\Escritorio\Cuidados_Intensivos\Modelos_Machine_Learning\sepsis_model.pkl', 'rb') as archivo:
    modelo = pickle.load(archivo)

def predict_sepsis(ritmo_cardiaco, GCS, PAS):
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
                         "GCS": [GCS],
                         "PAS": [PAS]})
    
    # Hacer la predicción de sepsis
    pred = modelo.predict(data)[0]
    
    # Retornar la cadena correspondiente
    if pred == 0:
        return "Negativo"
    else:
        return "Positivo"

# Crear la interfaz de Gradio
inputs = [gr.inputs.Number(label="ritmo_cardiaco"),
          gr.inputs.Number(label="GCS"),
          gr.inputs.Number(label="PAS")]
output = gr.outputs.Textbox(label="Sepsis")

gr.Interface(fn=predict_sepsis, inputs=inputs, outputs=output).launch(share=True)