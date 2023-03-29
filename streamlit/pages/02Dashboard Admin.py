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
        Dashboard Administrativo
    </h1>
    <p>
        Además de la labor titánica y humanitaria que realizan todos los días los médicos y personal de salud, no olvidemos que también se trata de empresas, que como tales, tienen que optimizar sus recursos para mantenerse a flote, es por este motivo la importancia de un dashboard administrativo, que apoye con esta tarea.
    </p>
    </div>
</div>
""")

#Embeber dashboard
components.iframe("https://app.powerbi.com/view?r=eyJrIjoiNDQ0NGZlNzItNjRmZC00YWQ4LWFmZDktMjJhNmFhOGFjN2E4IiwidCI6ImZhYWIyZWQzLTBkYjYtNGU1NS05N2YyLWU5NTZhNzQ5NTU4NyIsImMiOjR9 ", 
                  width=1300, height=2850, scrolling=False)

