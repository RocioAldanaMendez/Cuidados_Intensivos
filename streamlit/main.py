import streamlit as st
import streamlit.components.v1 as components


# Hace más ancha la página
st.set_page_config(layout="centered")

st.image('./images/medinova.png', width=230)
st.image('./images/main.jpg')


st.markdown("### Inteligencia de gestión para Unidad de Cuidados Intensivos")
st.markdown("* Centro de salud requiere de una solución completa de arquitectura de datos para poder gestionar todos sus datos en su servicio UCI.")  
st.markdown("* Necesita simplificar y optimizar la gestión de recursos  materiales como profesionales.")
st.markdown("* Gestionar información de manera efectiva y eficaz.")

st.title("")
col1, col2 = st.columns(2)
with col1:
    st.markdown("#### :blue[Dashboard Médico]")
    st.markdown("###### Es una herramienta que ayudará a los profesionales de la salud a tener datos en tiempo real, para tomar decisiones rápidas y asertivas.")

with col2:
    st.markdown("#### :blue[Dashboard Administrativo]")
    st.markdown("###### Su enfoque financiero, ayudará al personal al mando de esta área a conocer y administrar mejor los recursos.")

st.title("")
st.markdown("#### :blue[Modelos de Machine Learning]")
st.markdown("* **Modelo de detección de sepsis:** Por medio de parámetros sencillos predice rápidamente sepsis en los pacientes.")
st.markdown("* **Modelo de Mortalidad:** Ayuda a predecir la taza de mortalidad de los pacientres.")



