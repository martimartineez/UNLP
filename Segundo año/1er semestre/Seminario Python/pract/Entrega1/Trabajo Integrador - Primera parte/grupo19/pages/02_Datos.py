import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
import folium
from streamlit_folium import  st_folium
from folium.plugins import MarkerCluster
import plotly.express as px

def get_colora_aeropuerto(categoria):
    match categoria:
        case 'bajo':
            return 'green'
        case 'medio':
            return 'orange'
        case 'alto':
            return 'red'

def generate_map(df):
    '''
    Funcion que crea un mapa interactivo utilizando la biblioteca folium 
    para visualizar la ubicación de aeropuertos en Argentina.
    Cada aeropuerto está representado por un marcador que incluye información 
    detallada en una ventana emergente (popup). Los aeropuertos se agrupan en 
    clústeres para mejorar la visualización en áreas con alta densidad de puntos.
    '''

    attr = (
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> '
        'contributors, &copy; <a href="https://cartodb.com/attributions">CartoDB</a>'
    )

    # URL de los tiles
    tiles = 'https://wms.ign.gob.ar/geoserver/gwc/service/tms/1.0.0/capabaseargenmap@EPSG%3A3857@png/{z}/{x}/{-y}.png'

    # Crear un mapa de Folium centrado en una ubicación específica con zoom inicial
    mapa = folium.Map(location=[-38.4161, -63.6167], zoom_start=4,tiles=tiles, attr=attr)
    # Crear un grupo de marcadores (MarkerCluster) para gestionar múltiples marcadores en el mapa
    marker_cluster = MarkerCluster().add_to(mapa)
    # Iterar sobre cada fila del DataFrame para añadir un marcador por cada aeropuerto
    df.apply(lambda row: folium.Marker(
        location=[row['latitude_deg'], row['longitude_deg']],  # Coordenadas del aeropuerto
        popup=folium.Popup(f"""
            <div style="font-size: 18px;">
                <strong>{row['name']}</strong><br>
                Ciudad: {row['municipality']}<br>
                Categoría: {row['type']}<br>
                Elevación: {row['elevation_name']}
            </div>
        """, max_width=300),  # Contenido emergente del marcador con información detallada
        tooltip=row['name'],  # Texto que aparece al pasar el ratón sobre el marcador
        icon=folium.Icon(color=get_colora_aeropuerto(row['elevation_name']), icon='plane')  # Icono y color según la elevación del aeropuerto
    ).add_to(marker_cluster), axis=1)
    # Ajustar el mapa para que todos los marcadores sean visibles
    mapa.fit_bounds(marker_cluster.get_bounds())
    # Retornar el mapa interactivo generado
    return mapa

def mostrar_aeropuertos(df_filtrado,tipo_aeropuerto_visual):
    '''
    Funcion que crea y despliega un mapa interactivo que muestra la ubicación de aeropuertos en Argentina 
    '''
    # Generar el mapa interactivo utilizando la función generate_map
    mapa = generate_map(df_filtrado)
    # Título
    st.write(f'## Mapa interactivo mostrando Aeropuertos de los tipos {tipo_aeropuerto_visual} ✈️')
    # Mostrar el mapa interactivo en Streamlit
    st_folium(mapa, width=800, height=700)

def mostrar_tabla_aeropuertos_por_elevacion(df_filtrado):
    '''
    La función muestra una tabla que resume la cantidad de aeropuertos 
    según los diferentes tipos de elevación encontrados en el DataFrame filtrado.
    '''
    # Título
    st.write(f'## Cantidad de Aeropuertos según su elevación ⛰️')
    # Conteo de aeropuertos por tipo de elevación
    aeropuertos_por_elevacion = (
        df_filtrado['elevation_name']
        .value_counts()
        .reset_index()
        .rename(columns={'index': 'Elevación', 'elevation_name': 'Tipos de elevación'})
        .sort_values(by='Tipos de elevación', ascending=True)
    )
    # Mostrar la tabla en Streamlit
    st.table(aeropuertos_por_elevacion)

def mostrar_grafico_aeropuertos_por_provincia(df_filtrado, tipo_aeropuerto_visual):
    '''
    La función genera y muestra un gráficode barras que representa 
    la cantidad de aeropuertos de un tipo específico agrupados por provincia.
    '''
    # Título
    st.write(f'## Gráfico de Cantidad de Aeropuertos de tipo {tipo_aeropuerto_visual} por Provincia')
    # Conteo de aeropuertos por provincia
    aeropuertos_por_provincia = df_filtrado['region_name'].value_counts()
    # Convertir a DataFrame y renombrar columnas para claridad
    df_aeropuertos_por_provincia = aeropuertos_por_provincia.reset_index()
    df_aeropuertos_por_provincia.columns = ['Provincia', 'Cantidad de Aeropuertos']
    # Crear gráfico de barras con Plotly Express
    fig = px.bar(df_aeropuertos_por_provincia, x='Provincia', y='Cantidad de Aeropuertos')
    # Mostrar el gráfico en Streamlit
    st.plotly_chart(fig)


####################################################################### brandon

def mostrar_grafico_algoritmico(df):
    '''
    Este grafico nos muestra un grafico algoritmico comparando la superficie de cada lago
    en donde el numero de superficie va de 50 en 50 en el eje y
    '''
        # Verificar si hay datos faltantes y eliminarlos
    df = df.dropna(subset=['Nombre', 'Superficie (km²)'])


    # Crear gráfico de dispersión con nombres de lago en el eje x
    plt.figure(figsize=(10, 8))

# Graficar la línea de superficie en color naranja con puntos marcados
    plt.plot(df['Nombre'], df['Superficie (km²)'], 'o-', color='blue')

# Mostrar puntos marcados en la línea
    plt.plot(df['Nombre'], df['Superficie (km²)'], 'o', color='red',label='Superficie de lagos')
    plt.xlabel('Nombre del Lago', fontsize=12)
    plt.ylabel('Superficie (km²)', fontsize=12)
    plt.title('Gráfico Logarítmico de Superficies de Lagos en Argentina')
#plt.yscale('log')  # Establecer escala logarítmica en el eje y
    plt.xticks(rotation=50, ha='right', fontsize=10)  # Rotar las etiquetas para mejor legibilidad

  # Ajustar los valores del eje y para que se muestren de 50 en 50
    plt.yticks(range(0, int(df['Superficie (km²)'].max()) + 50, 50))
    plt.tight_layout()
    plt.subplots_adjust(bottom=0.3)  # Aumentar el valor de bottom para subir el gráfico
    # Mostrar el gráfico
    plt.show() 

    st.pyplot(plt)
    

# Función para obtener el color según la categoría
def get_color(valor):
    '''
    Funcion que determina con que color va a estar el marcador del lago 
    '''
    if valor <= 17:
        return 'green'
    elif valor <= 59:
        return 'yellow'
    else:
        return 'red'

def create_map(df):
    '''
    Funcion que crea un mapa utilizando la biblioteca folium para visualizar la ubicación de lagos en Argentina. 
    En donde cada lago de argentina tiene en su marcador (uso el popup) el nombre y superficie como datos.
    Tambien se usa el "MarkerCluster" para que nos agrupe los lagos y poder dar una mejor visivilidad al mapa.
    '''
    attr = (
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> '
        'contributors, &copy; <a href="https://cartodb.com/attributions">CartoDB</a>'
    )

    # URL de los tiles
    tiles = 'https://wms.ign.gob.ar/geoserver/gwc/service/tms/1.0.0/capabaseargenmap@EPSG%3A3857@png/{z}/{x}/{-y}.png'
    # Crear un mapa centrado en Argentina
    mapa = folium.Map(location=[-38.4161, -63.6167], zoom_start=4,tiles=tiles, attr=attr)

    # Crear un grupo de marcadores
    marker_cluster = MarkerCluster().add_to(mapa)

    # Añadir marcadores para cada lago usando apply
    df.apply(lambda row: folium.Marker(
        location=[row['Latitud'], row['Longitud']],
        popup=folium.Popup(f"""
            <div style="font-size: 18px;">
                <strong>{row['Nombre']}</strong><br>
                Superficie: {row['Superficie (km²)']} km²<br>
                Ubicación: {row['Ubicación']}
            </div>
        """, max_width=300),
        tooltip=row['Nombre'],
        icon=folium.Icon(color=get_color(row['Superficie (km²)']))  # Asignar color según la categoría
    ).add_to(marker_cluster), axis=1)

    # Añadir un marcador para las Islas Malvinas
    folium.Marker(
        location=[-51.7963, -59.5236],
        popup=folium.Popup(f"""
            <div style="font-size: 18px;">
                <strong>Islas Malvinas</strong><br>
                Superficie: ~12,000 km²<br>
                Ubicación: Atlántico Sur
            </div>
        """, max_width=300),
        tooltip='Islas Malvinas',
        icon=folium.Icon(color='blue')  # Puedes cambiar el color si lo deseas
    ).add_to(marker_cluster)

    # Ajustar el nivel de zoom para que todos los marcadores sean visibles
    mapa.fit_bounds(marker_cluster.get_bounds())

    return mapa
    

def mostrar_grafico_barras(df_lago):
    '''
    Esta funcion genera y muestra un gráfico de barras que hace referencia
    a la cantidad de lagos por provincia en donde cada provincia de lagos la compar con el total de lagos que hay en el pais
    '''
    # Contar la cantidad de lagos por provincia
    conteo_tipos = df_lago.Ubicación.value_counts()

    # Obtener el total de elementos en el dataset
    total_elementos = len(df_lago)

    # Crear una lista de la misma longitud que conteo_tipos con el valor total_elementos
    total_barras = [total_elementos] * len(conteo_tipos)

    # Definir el ancho de las barras
    width = 0.4

    # Generar las posiciones de las barras
    indices = range(len(conteo_tipos))

    # Convertir los índices a una lista de flotantes utilizando una operación de pandas
    indices = pd.Series(indices).astype(float)

    # Configurar el tamaño del gráfico
    plt.figure(figsize=(12, 8))

    # Crear las barras azules y naranjas adyacentes
    plt.bar(indices + width / 2, conteo_tipos, width=width, color='blue', label='Lagos por provincia')#, align='edge')
    plt.bar(indices - width / 2, total_barras, width=-width, color='orange', label='Total de lagos')#, align='edge')

    # Configurar etiquetas y título del gráfico
    plt.xlabel('Nombre provincia')
    plt.ylabel('Cantidad')
    plt.title('Cantidad de lagos por provincia y total de lagos en el dataset')
    plt.xticks(indices, conteo_tipos.index, rotation=12, ha='right')

    # Ajustar los márgenes
    plt.subplots_adjust(left=0.1, right=0.9, top=0.9, bottom=0.3)

    # Limitar el eje y para que las barras naranjas sean visibles
    plt.ylim(0, max(conteo_tipos.max(), total_elementos) + 5)
    plt.legend(title='')
    # Mostrar el gráfico
    plt.show()
    st.pyplot(plt)

# Función para mostrar visualizaciones de lagos
def mostrar_visualizaciones_tabla1(df):
    '''
    Funcion que nos muestra los graficos de lagos que podemos elegir, que nos permite elegir uno o varios de estos graficos.
    en donde usamos el dataset de lagos y cada funcion determina si hay que filtrarla datos no nulos
    '''
    opciones = ["Gráfico de superficies de lagos", "Mapa de Lagos", "Gráfico de cantidad de lagos en provincias"]

    opciones_seleccionadas = st.multiselect("Seleccione las visualizaciones que desea ver:", opciones)

    for opcion in opciones_seleccionadas:
        if opcion == "Gráfico de superficies de lagos":
            st.subheader("Gráfico algorítmico de Superficies de Lagos")
            mostrar_grafico_algoritmico(df)
            # Llamar a la función correspondiente o definir la lógica para mostrar este gráfico

        elif opcion == "Mapa de Lagos":
            st.header("Mapa de Lagos")
            mapa = create_map(df)
            st_folium(mapa, width=800, height=600)
            # Llamar a la función correspondiente o definir la lógica para mostrar este mapa

        elif opcion == "Gráfico de cantidad de lagos en provincias":
            st.subheader("Gráfico de Cantidad de Lagos por Provincia")
            mostrar_grafico_barras(df)
            # Llamar a la función correspondiente o definir la lógica para mostrar este gráfico

# Función para mostrar visualizaciones de aeropuertos
def mostrar_visualizaciones_tabla2(df_aeropuertos):
    '''
    Funcion que Filtra el DataFrame de aeropuertos para eliminar casos nulos en columnas importantes,
    capitaliza y normaliza la columna 'type', y permite la selección de uno o más tipos
    de aeropuertos para mostrar información específica.
    '''
    # Filtrado del datadrame para eliminar nulidad y mejorar la escritura de la columna type
    df_aeropuertos = df_aeropuertos.dropna(subset=['type','elevation_ft','region_name','municipality'])
    df_aeropuertos['type'] = df_aeropuertos['type'].str.replace('_', ' ').str.capitalize()
    
    # Se elige el tipo de aeropuerto en el multiselect para mostrar su información.
    tipos_aeropuerto_seleccionados = st.multiselect("Selecciona el tipo de aeropuerto para mostrar su información",
                                                    df_aeropuertos['type'].unique())
    df_filtrado = df_aeropuertos[df_aeropuertos['type'].isin(tipos_aeropuerto_seleccionados)]
    # Mostrar la cantidad de aeropuertos por elevación en una tabla
    if not df_filtrado.empty:
        aeropuerto_str = ", ".join(tipos_aeropuerto_seleccionados)
        # Generar el mapa interactivo y mostrarlo en Streamlit
        mostrar_aeropuertos(df_filtrado,aeropuerto_str)
        # Mostrar la tabla con la cantidad de aeropuertos por cada tipo de elevación
        mostrar_tabla_aeropuertos_por_elevacion(df_filtrado)
        # Mostrar el gráfico de cantidad de aeropuertos por provincia
        mostrar_grafico_aeropuertos_por_provincia(df_filtrado, aeropuerto_str)


# Título de la aplicación
st.title("Visualización de Datos de Lagos y Aeropuertos de Argentina")
# Subtítulo explicativo
st.subheader("Descripción")
st.write("""
En esta pagina se permite visualizar datos sobre lagos y aeropuertos en Argentina. 
En la primera pestaña, puedes ver varias visualizaciones relacionadas con los lagos, 
mientras que en la segunda pestaña, se presentan visualizaciones sobre los aeropuertos.
""")
# Leer los archivos CSV
file_airports=Path('./datasets/ar-airports.csv')
ruta_lagos = Path('.') / 'datasets' / 'lagos_arg.csv'
df_lagos = pd.read_csv(ruta_lagos)
df_aeropuertos = pd.read_csv(file_airports)

# Crear las pestañas
tab1, tab2 = st.tabs(["Visualizaciones lagos", "Visualizaciones de Aeropuertos"])

# Contenido de la Tab 1
with tab1:
    mostrar_visualizaciones_tabla1(df_lagos)

# Contenido de la Tab 2
with tab2:
    mostrar_visualizaciones_tabla2(df_aeropuertos)

