import pandas as pd
import pickle
import gradio as gr

# Cargar el modelo desde un archivo
with open('prediccion_mortalidad.pkl', 'rb') as archivo:
    modelo = pickle.load(archivo)

def predict_sepsis(ritmo_cardiaco, plaquetas, bilirrubina, PAM, GCS, creatinina, pO2, charlson_puntaje ):
    """
    Esta función clasifica si un paciente tiene una taza de mortalidad elevada o bajo, en base a los valores
    de sus signos vitales: ritmo cardíaco, GCS y PAS, etc  y el índice de Charlson.
    
    Args:
    - ritmo_cardiaco (float): Ritmo cardíaco del paciente.
    - GCS (float): Escala de Coma de Glasgow (GCS, por sus siglas en inglés) del paciente.
    - PAS (float): Presión arterial sistólica (PAS) del paciente.
    -etc
    
    Returns:
    - str: Cadena que indica si el paciente tiene una bajo o alto nivel de mortalidad.
    """
    # Crear un DataFrame con los valores de los signos vitales
    data = pd.DataFrame({"ritmo_cardiaco": [ritmo_cardiaco],
                         "plaquetas":[plaquetas],
                         "bilirrubina":[bilirrubina],
                         "PAM":[PAM],
                         "GCS": [GCS],
                         "creatinina":[creatinina],
                         "pO2": [pO2],
                         "charlson_puntaje": [charlson_puntaje]})
    
    # Hacer la predicción de sepsis
    pred = modelo.predict(data)[0]
    
    # Retornar la cadena correspondiente
    if pred == 0:
        return "El paciente tiene una taza de mortalidad de 10-14%"
    else:
        return "El paciente tiene una taza de mortalidad de 28%"

# Crear la interfaz de Gradio
inputs = [gr.inputs.Number(label="ritmo_cardiaco"),
          gr.inputs.Number(label="plaquetas"),
          gr.inputs.Number(label="bilirrubina"),
          gr.inputs.Number(label="PAM"),
          gr.inputs.Number(label="GCS"),
          gr.inputs.Number(label="creatinina"),
          gr.inputs.Number(label="pO2"),
          gr.inputs.Number(label="charlson_puntaje")]
output = gr.outputs.Textbox(label="Mortalidad")

gr.Interface(fn=predict_sepsis, inputs=inputs, outputs=output).launch()