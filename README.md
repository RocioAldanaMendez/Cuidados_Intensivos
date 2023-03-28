<h1 align=center>
 
 ![](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/blancogrande.png)

<h1 align=center> 
 
![](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/medinovaneg.png)

# INTRODUCCIÓN 


¡Bienvenidos a nuestro proyecto! 

Somos **SMARTDATA** una empresa especializada en Data, en el siguiente repositorio encontrarán el proceso de desarrollo y la solución implementada para las Unidades de Cuidados Intensivos (UCI). 


Para darles un poco más de contexto la situación evaluada fue enfocada a un centro de salud requiere de una solución completa de arquitectura de datos para poder gestionar todos estos datos y simplificar las gestiones de recursos del personal hospitalario, como también obtener toda la información analítica que puedan para optimizar los recursos disponibles.


Desde el momento uno de este trabajo, se consideraron los temas relacionados con los gastos y recursos, pero sin dejar de lado la importancia ética y moral que se requiere en este ambiente profesional en específico. 


# OBJETIVOS 


Para lograr recorrer un camino más claro, lo primero que se hizo fue plantear las metas a las cuales apuntamos a llegar para dar una solución concreta, efectiva y escalable en el tiempo.


Los principales puntos que abordaremos son los siguientes:


- **Administración de recursos hospitalarios** mínimos para asegurar la calidad de atención y el servicio brindado.


- Implementación de **historiales clínicos digitales**, de fácil lectura y carga.


- **Gestión de datos del paciente**, convoca lo relacionado a optimizar flujos y almacenamiento de datos, como también la correcta asignación de pacientes a las unidades médicas. 


# STACK TECNOLÓGICO 


Scope of work, hace referencia a las herramientas tecnológicas que se implementaran, tales como:


- **WINDOWS**, en sus versiones mayores o iguales a 10. Sistema operativo que posibilita la administración de los recursos de una computadora. Desarrollados y vendido por Microsoft.


- **AWS**, colección de servicios de computación en la nube pública que en conjunto forman una plataforma de computación en la nube.


- **Amazon S3**, es un servicio ofrecido por Amazon Web Services que proporciona almacenamiento de objetos a través de una interfaz de servicio web, es una infraestructura de almacenamiento escalable. 


- **DOCKER**, proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores de software.


- **AIRFLOW**, para la carga y control de flujo, gestiona el flujo de datos, de código abierto, escrito en Python.


- **RDS**, es un servicio de Bases de Datos Relacionales Es un servicio web que se ejecuta "en la nube" diseñado para simplificar la configuración, el funcionamiento y el escalado.


- **Visual Studio Code**, es un editor de código fuente desarrollado por Microsoft para Windows, Linux, macOS y Web. Incluye soporte para la depuración, control integrado de Git, resaltado de sintaxis, finalización inteligente de código, fragmentos y refactorización de código. 


- **Lenguajes de programación**,  **Python** es un lenguaje de alto nivel de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código. **SQL** lenguaje de dominio específico, diseñado para administrar, y recuperar información de sistemas de gestión de bases de datos relacionales. 


- **PowerBI**, es un servicio de análisis de datos de Microsoft orientado a proporcionar visualizaciones interactivas y capacidades de inteligencia empresarial con una interfaz óptima y sencilla. 


- **Streamlit**, es un “framework” de Python de código abierto que permite de manera sencilla e integrada desarrollar aplicaciones gracias a la interacción con otras librerías para su empleo.


- **TRELLO**, un software de administración y organización de proyectos con interfaz web.


- **GITHUB** (Local, Nube y Desktop), es una forja para alojar proyectos utilizando el sistema de control de versiones Git. 


- **DRAW.IO**, es un software de dibujo gráfico multiplataforma gratuito y de código abierto desarrollado en HTML5 y JavaScript. Su interfaz se puede utilizar para crear diagramas. 


- **Google Drive**, es un servicio de alojamiento y sincronización de archivos desarrollado por Google, permite almacenar archivos en la nube, sincronizar archivos entre dispositivos y compartir archivos. 


- **Excel**, es una hoja de cálculo desarrollada por Microsoft para Windows. 


- **Word**, es un software de tratamiento de textos. 


- **Discord**, es un servicio de mensajería instantánea y chat de voz VolP. Funciona a través de servidores y está separado en canales de texto o de voz. 


- **Slack**, es un programa de mensajería instantánea, se desarrolló para comunicaciones profesionales y organizacionales, pero también se ha adoptado como una plataforma comunitaria. 


- **Google Meet**, es un servicio de reuniones virtuales desarrollado por Google. 


# METODOLOGÍA DE TRABAJO 

La metodología Scrum permite abordar proyectos complejos desarrollados en entornos dinámicos y cambiantes de un modo flexible. Está basada en entregas parciales y regulares del producto final en base al valor que ofrecen a los clientes. 

Es una opción de gestión ideal para acometer proyectos desarrollados en entornos complejos que exigen rapidez en los resultados y en los que la flexibilidad es un requisito imprescindible. Scrum ofrece agilidad y el resultados de valor. 

**Diagrama de Gantt** `<link>`: <https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/Plan%20de%20trabajo.xlsx>

# ETL 

El ETL es un proceso fundamental en la gestión de datos, utilizado con los siguientes fines: 

- Integración de datos: Permite integrar datos de las tablas en un solo sistema para su análisis y toma de decisiones. 

- Limpieza y normalización de datos: Limpiar y normalizar los datos para que sean consistentes y útiles. 

- Mejora de la calidad de los datos: Para mejorar la calidad de los datos eliminando errores y redundancias. 

- Agilización del análisis de datos: La carga de datos en un sistema de destino permite un acceso más rápido y eficiente a los datos para su análisis. 

- Ahorro de tiempo y costos: Permite ahorrar tiempo y costos en la gestión manual de datos, reduciendo errores y mejorando la eficiencia. Luego será automatizado. 

**RESUMEN DE ETL**  

-Carga de datos en Python. Transformaciones en Python:  

	-Información de las tablas  

	-Quitar espacios vacíos 

	-Cambiar a formato texto para la conexión posterior. 

-Creación de la conexión con MySQL mediante "SqlAlquemy".

-Transformaciones en MySQL: 

	-Modificación de tipos de datos al correcto 

	-Conversión de nulos 

	-Creación de PK y FK 

-Modelado de relaciones entre los datos. 

**MODELADO DE DATOS**

**Médico**

![imagen1](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/Modelado%20de%20DB%20-%20Medinova%202-Modelo%20m%C3%A9dico.drawio.png) 

**Administrativo**

![imagen1](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/Modelado%20de%20DB%20-%20Medinova%202-Modelo%20Financiero.drawio.png) 

## **ESQUEMA DE RELACIONES**

![imagen1](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/Modelo_mimic3.png) 


**Diccionario**,  `<link>` : <https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/DICCIONARIO_MIMIC.pdf>  

Se adjuntan los links de desarrollo: 

`<link>` : <https://github.com/RocioAldanaMendez/Cuidados_Intensivos/blob/main/datatype%20.sql> 

`<link>` : <https://github.com/RocioAldanaMendez/Cuidados_Intensivos/blob/main/Dump20230316.zip>


# AUTOMATIZACIÓN

## PIPELINE

![imagen1](https://github.com/RocioAldanaMendez/Cuidados_Intensivos/blob/main/assets/PIPELINE%20FINAL.png) 

## WORKFLOW AIRFLOW

 Documentación filmica AQUÍ `<link>`: <https://raw.githubusercontent.com/RocioAldanaMendez/Cuidados_Intensivos/main/assets/Video%20de%20WhatsApp%202023-03-23%20a%20las%2013.53.50.mp4>


A continuación se adjunta el link para ingresar a la carpeta con los archivos **DAG's** : `<link>`: <https://github.com/RocioAldanaMendez/Cuidados_Intensivos/tree/main/Atomatizacion_v2.0/Medinova_servicios/dags>


# KPI’s  

Medidas que se utilizan para evaluar el desempeño de la organización o en función de objetivos específicos. Se seleccionaron cuidadosamente para evaluar la eficacia de los esfuerzos para lograr objetivos. 

Proporcionan información objetiva y medible sobre el desempeño, permite tomar decisiones informadas y tomar medidas para mejorar. 

Los seleccionados para MEDINOVA son: 

- Reducir el 2% el reingreso de pacientas a la UCI. 

- Reducir el promedio de estadía en UCI a 3,5. 

- Reducir inicialmente en un 10% la cantidad de medicamentos recetados extra.

- Reducir la cantidad de muertes a 10 de cada 100 ingresos dentro de la estadia de la unidad. 

- Aumentar la cantidad de personal para atención, llegando a un máximo de 4 pacientes por profesional.

# DASHBOARDS

## MÉDICO 

`<link>`: <https://app.powerbi.com/view?r=eyJrIjoiZTg2OWQ0MWUtZmY0ZS00MGYxLTk2ZDUtNDM4MDgyNzY2NTg4IiwidCI6ImZhYWIyZWQzLTBkYjYtNGU1NS05N2YyLWU5NTZhNzQ5NTU4NyIsImMiOjR9>


![imagen1](https://github.com/RocioAldanaMendez/Cuidados_Intensivos/blob/main/assets/MEDICO.png) 


## ADMINISTRATIVO

`<link>`: <https://app.powerbi.com/view?r=eyJrIjoiZTg2OWQ0MWUtZmY0ZS00MGYxLTk2ZDUtNDM4MDgyNzY2NTg4IiwidCI6ImZhYWIyZWQzLTBkYjYtNGU1NS05N2YyLWU5NTZhNzQ5NTU4NyIsImMiOjR9>


![imagen1](https://github.com/RocioAldanaMendez/Cuidados_Intensivos/blob/main/assets/ADMINISTRATIVO.png) 



# MODELO DE MACHINE LEARNING

Siguiendo los criterios medicos de evaluaciones tales como el qSOFA, SOFA y Charlson, se desarrollaron dos modelos de Machine Learning, tomando como esquema el "Árbol de decisión" debido a que este tipo de modelo permite dividir los datos de entrada en grupos más pequeños y más homogéneos basados en una serie de preguntas, en este caso basado en los criterios anteriormente comentados. 

Obtuvimos como resultado los siguientes modelos para los dos grandes problemas detectados en UCI, uno para la mortalidad y otro para la sepsis.

**Modelo de predicción de mortalidad** 

Este modelo utiliza datos de pacientes para predecir la probabilidad de muerte en la UCI. Los datos pueden incluir variables como los niveles de presión arterial, los resultados de pruebas de laboratorio, la presencia de comorbilidades, entre otros. 

 `<link>`: < https://huggingface.co/spaces/RoTesla/Prediccion_Mortalidad_en_UCI>

  ![imagen1](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/2.gif) 


**Modelo de detección de sepsis**

 Este modelo utiliza datos de pacientes para detectar la sepsis temprano y permitir un tratamiento oportuno. Los datos pueden incluir variables como la temperatura corporal, los niveles de lactato, los resultados de pruebas de laboratorio, entre otros. 


 `<link>`: <https://huggingface.co/spaces/RoTesla/Deteccion_Sepsis>

  ![imagen1](https://github.com/CarCarrasco1/Cuidados_Intensivos/blob/main/assets/1.gif) 


# CONCLUSIONES 

 
El análisis de Big Data parece tener un impacto positivo en la atención de enfermedades crónicas. A pesar de las preocupaciones de los costos de implementación y la eficacia del análisis de datos, los hospitales y otros entornos de atención crónica han visto resultados iniciales prometedores en términos de mejora en los resultados clínicos, así como en la financiación. 


La automatización del flujo de carga de datos reduce el trabajo manual, mejora la calidad y precisión del dato y reduce el tiempo de disposición de la información que son indispensables para la toma de decisiones en UCI.  

Obtener datos limpios y de calidad en la UCI es esencial para garantizar una atención médica segura y efectiva para los pacientes. Así como para la investigación, análisis y posterior prevención de afectaciones. 


Entonces es gracias a las investigaciones basadas en los datos, es que se pueden desarrollar este tipo de productos como los que presentamos. Que aportan eficacia y eficiencia del uso de los datos en la unidad de cuidados intensivos, ampliando la cobertura de dicha unidad y brindando más soluciones, tanto para la toma de deciones médicas como para la toma de decisiones administrativo/finacieras.

De la mano de *Smartdata*, con proyectos como **Medinova** hacemos realidad esta visión y reafirmamos un compromiso que nos mueve: 


***"La tecnología es importante, pero lo único que realmente importa es que hacemos con ella."***
 ***Muhammad Yunus***



**LINK A LA DOCUMENTACIÓN:** `<link>`: <https://github.com/RocioAldanaMendez/Cuidados_Intensivos/blob/main/IEEE_830_MEDINOVA_V2.2.docx>


## DESARROLLADORES

| [<img src="https://avatars.githubusercontent.com/u/83037176?v=4" width=115><br><sub>Rocío Méndez</sub>](https://github.com/RocioAldanaMendez)  | [<img src="https://avatars.githubusercontent.com/u/109556951?v=4" width=115><br><sub>Carla Carrasco</sub>](https://github.com/CarCarrasco1) | [<img src="https://avatars.githubusercontent.com/u/106095273?v=4" width=115><br><sub>Osvaldo Spolzino</sub>](https://github.com/Rolajim) | [<img src="https://avatars.githubusercontent.com/u/114433631?v=4" width=115><br><sub>Mauren Hermosillo</sub>](https://github.com/Maurengit) |[<img src="https://avatars.githubusercontent.com/u/111803864?v=4" width=115><br><sub>Rodrigo Pérez</sub>](https://github.com/roprz) |
| :---: | :---: | :---: | :---: | :---: | 



## ESTADO: 

<h4 align="center"> :beginner: Proyecto en proceso :beginner: </h4> 


 ## SUPERVICIÓN
 | [<img src="https://avatars.githubusercontent.com/u/98837320?v=4" width=115><br><sub>Dr. Maico Bernal</sub>](https://github.com/maicobernal)  |
| :---: |

**Dr.Maico Bernal** - Médico y Data Science - 



<i>Muchisimas gracias por ver este desarrollo, podes seguir los futuros cambios dandole una estrellita en la parte superior derecha del repositorio. Podés Clonarlo, y/o podes hacer un PullRequest ya que todo aporte es bienvenido.</i> :smiley::wave: 

