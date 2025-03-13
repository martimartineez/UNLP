import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
import folium
from streamlit_folium import  st_folium
from folium.plugins import MarkerCluster
from datetime import datetime, timedelta, date
from graficos_punto6 import gragficosp6

def mostrar_visualizacion(opcion, visualizaciones_mostradas, df, fecha_inicio=None, fecha_fin=None):
    '''
    esta funcion nos permite agrupar y selecionar los distintos tipos d graficos, en donde podemos seleccionar
    uno o varios graficos para ver
    '''
    if df is None or df.shape[0] == 0:
        st.error("El DataFrame no se encuentra o está vacío.")
    else:
        if opcion == "Mostrar Gráfico de Torta por Género" and "Mostrar Gráfico de Torta por Género" not in visualizaciones_mostradas:
            gragficosp6.grafico_torta_usuarios_por_genero(df)
            visualizaciones_mostradas.append("Mostrar Gráfico de Torta por Género")
        elif opcion == "Mostrar Gráfico de Torta por Puntuaciones" and "Mostrar Gráfico de Torta por Puntuaciones" not in visualizaciones_mostradas:
            gragficosp6.grafico_torta_puntuaciones_superior_media(df)
            visualizaciones_mostradas.append("Mostrar Gráfico de Torta por Puntuaciones")
        elif opcion == "Mostrar Gráfico de Barras por Día" and "Mostrar Gráfico de Barras por Día" not in visualizaciones_mostradas:
            gragficosp6.grafico_barras_partidas_por_dia(df)
            visualizaciones_mostradas.append("Mostrar Gráfico de Barras por Día")
        elif opcion == "Mostrar Promedio de Preguntas Acertadas Mensuales" and "Mostrar Promedio de Preguntas Acertadas Mensuales" not in visualizaciones_mostradas:
            if fecha_inicio and fecha_fin:
                gragficosp6.promedio_preguntas_acertadas_mensuales(df, fecha_inicio, fecha_fin)
                visualizaciones_mostradas.append("Mostrar Promedio de Preguntas Acertadas Mensuales")
            else:
                st.error("Se necesitan fechas de inicio y fin para esta visualización.")
        elif opcion == "Mostrar Top 10 Usuarios por Puntuaje" and "Mostrar Top 10 Usuarios por Puntuaje" not in visualizaciones_mostradas:
            if fecha_inicio and fecha_fin:
                gragficosp6.top_10_usuarios_mayor_puntaje(df, fecha_inicio, fecha_fin)
                visualizaciones_mostradas.append("Mostrar Top 10 Usuarios por Puntuaje")
            else:
                st.error("Se necesitan fechas de inicio y fin para esta visualización.")
        elif opcion == "Ordenar los datasets por dificultad" and "Ordenar los datasets por dificultad" not in visualizaciones_mostradas:
            gragficosp6.ordenar_dificultad_tematica(df)
            visualizaciones_mostradas.append("Ordenar los datasets por dificultad")
        elif opcion == "Gráfico de líneas con dos usuarios para compararlos" and "Gráfico de líneas con dos usuarios para compararlos" not in visualizaciones_mostradas:
            visualizaciones_mostradas.append("Gráfico de líneas con dos usuarios para compararlos")
            usuarios = df['Usuario'].unique()
            usuarios_seleccionados = st.multiselect("Seleccione dos usuarios para comparar:", options=usuarios)
            if len(usuarios_seleccionados) == 2:
                gragficosp6.comparar_usuarios(df, usuarios_seleccionados)
        elif opcion == "Mostrar mejor temática por género" and "Mostrar mejor temática por género" not in visualizaciones_mostradas:
            visualizaciones_mostradas.append("Mostrar mejor temática por género")
            gragficosp6.listar_genero_mejor_tematica(df)
        elif opcion == "Mostrar detalle de dificultades" and "Mostrar detalle de dificultades" not in visualizaciones_mostradas:
            visualizaciones_mostradas.append("Mostrar detalle de dificultades")
            gragficosp6.listar_dificultad_veces_elegida(df)
        elif opcion == "Mostrar usuarios en racha" and "Mostrar usuarios en racha" not in visualizaciones_mostradas:
            visualizaciones_mostradas.append("Mostrar usuarios en racha")
            gragficosp6.listar_usuarios_en_racha(df)
    

# Capturar las opciones de visualización del usuario
opciones = [
    "Mostrar Gráfico de Torta por Género",
    "Mostrar Gráfico de Torta por Puntuaciones",
    "Mostrar Gráfico de Barras por Día",
    "Mostrar Promedio de Preguntas Acertadas Mensuales",
    "Mostrar Top 10 Usuarios por Puntuaje",
    "Ordenar los datasets por dificultad",
    "Gráfico de líneas con dos usuarios para compararlos",
    "Mostrar mejor temática por género",
    "Mostrar detalle de dificultades",
    "Mostrar usuarios en racha"
]

ruta_archivo = Path('.') / 'datasets' / 'Partidas.csv'
df= gragficosp6.cargar_datos(ruta_archivo)

# Título de la aplicación
st.title("Visualización de Datos de las paridas")
# Subtítulo explicativo
st.subheader("Descripción")
st.write("""
En esta pagina se les permitimos mostrar los distintos tipos de visualizaciones de las partidas.
En donde podemos ver un top 10 usuarios, pueden ingresar fechas y ver las preguntas acertadas, 
quines son los usiuarios en racha, etc.
""")
# Permitir al usuario seleccionar múltiples opciones
opciones_seleccionadas = st.multiselect("Seleccione las visualizaciones que desea ver:", opciones)

# Capturar fechas del usuario si seleccionan opciones que requieren fechas
if "Mostrar Promedio de Preguntas Acertadas Mensuales" in opciones_seleccionadas or "Mostrar Top 10 Usuarios por Puntuaje" in opciones_seleccionadas:
    fecha_inicio = st.sidebar.date_input("Fecha de inicio", min_value=date(2000, 1, 1), max_value=date.today() - timedelta(days=1), value=date.today() - timedelta(days=7))
    fecha_fin = st.sidebar.date_input("Fecha de fin", min_value=date(2000, 1, 2), max_value=date.today(), value=date.today())
else:
    fecha_inicio = date.min
    fecha_fin = date.max

# Mantener un registro de las visualizaciones que ya se han mostrado
visualizaciones_mostradas = []

# Mostrar las visualizaciones seleccionadas
for opcion in opciones_seleccionadas:
    mostrar_visualizacion(opcion, visualizaciones_mostradas, df, fecha_inicio, fecha_fin)