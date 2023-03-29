# Librerías
import streamlit as st
import streamlit.components.v1 as components

# Hace más ancha la página
st.set_page_config(layout="wide")

# Encabezado
components.html("""
<div>
    <style>
        .box {
            width: 1250px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .heading{
            background-color:blueviolet;
            color:lightyellow;
            border-radius: 20px;
            text-align:center;
        }
    </style>
    <div class="box">
    <h1>
        Dashboard Médico
    </h1>
    <p>
        Contar con un herramienta tecnológica como un dashboard médico en la Unidad de Cuidados Intensivos, es muy útil, ya que en tiempo real estamos recibiendo miles de datos limpios y filtrados que serán muy importantes para poder tomar decisiones informadas, asertivas y con mayor rapidez, en un ámbito hospitalario el tiempo es vital. 
    </p>
    </div>
</div>
""")


#Embeber dashboard
components.iframe("https://app.powerbi.com/view?r=eyJrIjoiZTg2OWQ0MWUtZmY0ZS00MGYxLTk2ZDUtNDM4MDgyNzY2NTg4IiwidCI6ImZhYWIyZWQzLTBkYjYtNGU1NS05N2YyLWU5NTZhNzQ5NTU4NyIsImMiOjR9 ", 
                  width=1300, height=900, scrolling=False)