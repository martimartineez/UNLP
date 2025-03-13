import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
from datetime import datetime, timedelta

def cargar_datos(ruta):
    """Cargar datos desde un archivo CSV."""
    return pd.read_csv(ruta)

def grafico_torta_usuarios_por_genero(df):
    """
    Crear un gráfico de torta con la distribución de usuarios por género en formato de porcentaje.
    """
    #punto 1-.-----------------------------------------------------------------------------------------------------------------------------------------------------
    punto1 = df.groupby('Genero')['Usuario'].nunique()

    # Crear gráfico de torta
    fig, ax = plt.subplots()
    ax.pie(punto1, labels=punto1.index, autopct='%1.1f%%', startangle=90)
    ax.axis('equal')  # Para asegurar que el gráfico sea un círculo.

    # Título del gráfico
    plt.title('Distribución de Usuarios por Género')
    # Mostrar el gráfico
    st.write("Mostrando Gráfico de Torta por Género")
    st.pyplot(plt)


def grafico_torta_puntuaciones_superior_media(df):
    """
    Crear un gráfico de torta con el porcentaje de partidas que tienen una puntuación superior a la media.
    """
    #2. Gráfico de torta con porcentaje de partidas que tienen una puntuación superior a la media (promedio de calificaciones).------------------------------------------------

    # Convertir la columna 'Correctas' a tipo numérico, coaccionando errores
    df['Correctas'] = pd.to_numeric(df['Correctas'], errors='coerce')

    # Eliminar filas con valores NaN en 'Correctas'
    df = df.dropna(subset=['Correctas'])

    # Calcular la media de las puntuaciones
    media_puntuacion = df['Correctas'].mean()

    # Determinar cuántas partidas tienen una puntuación superior a la media
    partidas_superior_media = df[df['Correctas'] > media_puntuacion].shape[0]
    partidas_inferior_igual_media = df.shape[0] - partidas_superior_media

    # Crear datos para el gráfico de torta
    labels = ['Puntuación Superior a la Media', 'Puntuación Igual o Inferior a la Media']
    sizes = [partidas_superior_media, partidas_inferior_igual_media]

    # Crear gráfico de torta
    fig, ax = plt.subplots()
    ax.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
    ax.axis('equal')  # Para asegurar que el gráfico sea un círculo.

    # Título del gráfico
    plt.title('Porcentaje de Partidas con Puntuación Superior a la Media')
    # Mostrar el gráfico
    st.write("Mostrando Gráfico de Torta por Puntuaciones")
    st.pyplot(plt)

def grafico_barras_partidas_por_dia(df):
    """
    Crear un gráfico de barras que para cada día de la semana que en este se visualiza la cantidad de partidas realizadas.
    """
    #3. Gráfico de barras que para cada día de la semana muestre la cantidad de partidas realizadas.----------------------------------------------------------------------

    # Convertir la columna 'Fecha' a tipo datetime
    df['Fecha_Hora'] = pd.to_datetime(df['Fecha_Hora'])

    # Agrupar por día de la semana y contar partidas
    partidas_por_dia = df.groupby(df['Fecha_Hora'].dt.day_name())['Fecha_Hora'].count()

    # Ordenar los días de la semana para asegurar el orden correcto en el gráfico
    dias_ordenados = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    partidas_por_dia = partidas_por_dia.reindex(dias_ordenados, fill_value=0)

    # Crear gráfico de barras
    fig, ax = plt.subplots()
    partidas_por_dia.plot(kind='bar', ax=ax, color='skyblue')

    # Etiquetas y título
    ax.set_xlabel('Día de la Semana')
    ax.set_ylabel('Cantidad de Partidas')
    ax.set_title('Cantidad de Partidas por Día de la Semana')
    
    st.write("Mostrando Gráfico de Barras por Día")
    # Mostrar el gráfico
    plt.tight_layout()
    st.pyplot(plt)

def promedio_preguntas_acertadas_mensuales(df, fecha_inicio, fecha_fin):
    """
    Calcular y graficar el promedio de preguntas acertadas mensuales entre un rango de dos fechas.
    En donde la fecha de inicio es menor a la fecha de fin
    """
    #4. Promedio de preguntas acertadas mensuales entre un rango de dos fechas insertadas en dos inputs.---------------------------------------------------------
    fecha_inicio = datetime.combine(fecha_inicio, datetime.min.time())
    fecha_fin = datetime.combine(fecha_fin, datetime.max.time())

    # Convertir la columna 'Fecha_Hora' a tipo datetime
    df['Fecha_Hora'] = pd.to_datetime(df['Fecha_Hora'])

    # Filtrar el DataFrame por el rango de fechas, le hace una copia para no modificar el original
    df_filtrado = df[(df['Fecha_Hora'] >= fecha_inicio) & (df['Fecha_Hora'] <= fecha_fin)].copy()

    # Calcular el promedio mensual de preguntas acertadas
    df_filtrado['Correctas'] = pd.to_numeric(df_filtrado['Correctas'])  # Convertir 'Correctas' a numérico si no lo está
    df_filtrado['Mes'] = df_filtrado['Fecha_Hora'].dt.month
    df_filtrado['Año'] = df_filtrado['Fecha_Hora'].dt.year
    promedio_preguntas_acertadas = df_filtrado.groupby(['Año', 'Mes'])['Correctas'].mean().reset_index()

    # Crear figura y ejes para el gráfico del promedio mensual de preguntas acertadas
    fig, ax1 = plt.subplots(figsize=(10, 6))
    ax1.bar(promedio_preguntas_acertadas.index, promedio_preguntas_acertadas['Correctas'], color='skyblue')

    # Configurar el eje x
    meses = promedio_preguntas_acertadas['Mes'].astype(str) + '/' + promedio_preguntas_acertadas['Año'].astype(str)
    ax1.set_xticks(promedio_preguntas_acertadas.index)
    ax1.set_xticklabels(meses, rotation=45, ha='right')

    # Etiquetas y título
    ax1.set_xlabel('Mes')
    ax1.set_ylabel('Promedio de Preguntas Acertadas')
    ax1.set_title('Promedio de Preguntas Acertadas Mensual')

    # Mostrar el gráfico
    st.write("Mostrando Promedio de Preguntas Acertadas Mensuales")
    plt.tight_layout()
    st.pyplot(plt)

def top_10_usuarios_mayor_puntaje(df, fecha_inicio, fecha_fin):
    """
    Mostrar el top 10 de usuarios con mayor cantidad de puntos acumulados entre un rango de dos fechas ingresadas por el usuario en donde 
    la fecha de inicio debe ser menor a la fecha de fin
    """
    #5. Top 10 de usuarios con mayor cantidad de puntos acumulados entre un rango de dos fechas insertadas por input.-.---------------------------------------------------
    fecha_inicio = datetime.combine(fecha_inicio, datetime.min.time())
    fecha_fin = datetime.combine(fecha_fin, datetime.max.time())
    # Convertir la columna 'Fecha_Hora' a tipo datetime si no lo está
    df['Fecha_Hora'] = pd.to_datetime(df['Fecha_Hora'])

    # Filtrar el DataFrame por el rango de fechas
    df_filtrado = df[(df['Fecha_Hora'] >= fecha_inicio) & (df['Fecha_Hora'] <= fecha_fin)].copy()

    # Convertir la columna 'Puntaje' a numérico
    df_filtrado['Puntaje'] = pd.to_numeric(df_filtrado['Puntaje'], errors='coerce')

    # Agrupar por usuario y calcular la suma de puntos acumulados
    puntos_acumulados = df_filtrado.groupby('Usuario')['Puntaje'].sum().reset_index()

    # Ordenar los usuarios por la cantidad de puntos acumulados de manera descendente
    top_10_usuarios = puntos_acumulados.nlargest(10, 'Puntaje')

    # Mostrar el resultado del top 10 de usuarios
    # Mostrar el resultado del top 10 de usuarios en Streamlit
    st.write("Top 10 de usuarios con mayor cantidad de puntos acumulados:")
    st.dataframe(top_10_usuarios)

def ordenar_dificultad_tematica(df):
    '''
    Función diseñada para procesar un DataFrame df que contiene datos de las partidas.
    Se ordena en una tabla según la dificultad, temática (dataset), y el número de errores cometidos.
    '''
    # Calcula el número de errores cometidos
    df['Errores'] = 5 - df['Correctas']  # Asumo que son 5 preguntas en total
    # Agrupar por 'Dificultad' y 'Temática', sumar los errores
    df_agrupado = df.groupby(['Dificultad', 'Temática'])['Errores'].sum().reset_index()
    # Definir el orden personalizado para la columna 'Dificultad'
    df_agrupado['Dificultad'] = pd.Categorical(df_agrupado['Dificultad'], categories=['difícil', 'media', 'fácil'], ordered=True)
    # Ordenar primero por 'Dificultad' ascendente y luego por 'Errores' descendente
    df_agrupado.sort_values(by=['Dificultad', 'Errores'], ascending=[True, False], inplace=True)
    # Mostrar la tabla final con Streamlit
    st.write("### Promedio de Errores por Dificultad y Temática")
    st.table(df_agrupado)

def comparar_usuarios(df, usuarios_seleccionados):
    '''
    La función está diseñada para comparar los puntajes de los usuarios seleccionados a lo largo del tiempo.
    Primero, filtra los datos para incluir solo los usuarios seleccionados. Ubica las fechas y asigna
    los puntajes a sus respectivos usuarios. Antes de terminar reescribo las ubicaciones y etiquetas de las marcas
    del eje x del grafico y por ultimo muestra el gráfico de líneas
    '''
    # Filtrar el DataFrame para los usuarios seleccionados
    df_filtrado = df[df['Usuario'].isin(usuarios_seleccionados)]
    # Convertir 'Fecha_Hora' a tipo datetime si no lo está ya
    df_filtrado['Fecha_Hora'] = pd.to_datetime(df_filtrado['Fecha_Hora'])
    # Ordenar por 'Fecha_Hora' (primero por año, luego por mes, luego por día, hora y minutos)
    df_filtrado = df_filtrado.sort_values(by='Fecha_Hora')
    # Crear el gráfico de líneas
    plt.figure(figsize=(15, 6))
    # Agrupar y graficar por usuario
    for usuario in usuarios_seleccionados:
        grupo = df_filtrado[df_filtrado['Usuario'] == usuario]
        etiqueta_usuario = f'Puntaje de {usuario}'
        plt.plot(grupo['Fecha_Hora'], grupo['Puntaje'], marker='o', linestyle='-', label=etiqueta_usuario)
    # Formatear las etiquetas del eje x manualmente
    etiquetas = df_filtrado['Fecha_Hora'].dt.strftime('%d-%m-%Y %H:%M').unique()
    posiciones = df_filtrado['Fecha_Hora'].unique()
    plt.xticks(ticks=posiciones, labels=etiquetas, rotation=60)
    # Añadir etiquetas y título
    plt.xlabel('Fecha (Día-Mes-Año Hora:Minutos)')
    plt.ylabel('Puntaje')
    plt.title('Comparación de puntajes de usuarios a lo largo del tiempo')
    plt.legend()
    # Mostrar el gráfico en Streamlit
    st.pyplot(plt)

def listar_genero_mejor_tematica(df):
    '''
        agrupa los datos por genero y tematica, sumando los datos de correctas,filtra y se queda con la mejor
          tematica de cada genero
    '''
    agrupado = df.groupby(['Genero','Temática'])['Correctas'].sum().reset_index() # agrupo por genero y tematica, aplico sum en correctas
    indiceMax = agrupado.groupby('Genero')['Correctas'].idxmax() # me quedo con los generos y tomo el maximo indice de cada uno segun correctas
    df_filtrado = agrupado.loc[indiceMax] # filtro y me quedo con los de esos indices
    st.subheader('Mejor tematica por genero:')
    st.dataframe(df_filtrado,hide_index=True,width=800)

def listar_dificultad_veces_elegida(df):
    '''
    agrupa las dificultades y calcula para cada una el promedio y las veces que aparece
    '''
    promedio = df.groupby(['Dificultad'])['Puntaje'].agg(['mean','size']).reset_index() # agrupo y aplico varias operaciones a la vez
    promedio.columns = ['Dificultad','Puntaje promedio','Elegida'] # cambio nombre de columnas
    st.subheader('Dificultades con sus puntajes promedios y cuantas veces fue elegida:')
    st.dataframe(promedio,hide_index=True,width=800)

def listar_usuarios_en_racha(df):
    '''
    filtra las partidas de los ultimos 7 dias, agrupa los usuarios y muestra los que jugaron durante los 7 dias
    '''
    df['Fecha_Hora'] = pd.to_datetime(df['Fecha_Hora']) # cambio formato de la columna fecha hora

    hoy = pd.Timestamp('today') # defino fecha actual
    atras = hoy - pd.DateOffset(days=7) # desplazamiento a fecha de hace 7 dias
    
    df_filtrado = df[(df['Fecha_Hora'] >= atras) & (df['Puntaje'] > 0)] # me quedo con los de los ultimos 7 dias y los que tienen puntaje mayor a 0
    
    usuarios = df_filtrado.groupby(['Usuario', df_filtrado['Fecha_Hora'].dt.date]).size().reset_index(name='Cantidad') #me quedo con usuarios, los dias que jugaron y cuantas veces por dia
    
    usuariosEnRacha = usuarios.groupby(['Usuario']).filter(lambda x: len(x) == 7)['Usuario'].unique() # tomo los nombres de usuarios y me quedo con los que aparecen 7 veces, y solo me quedo con los valores unicos
    st.subheader('Usuarios en racha:')
    st.dataframe(usuariosEnRacha,width=800)
