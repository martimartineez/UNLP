from pathlib import Path

import streamlit as st
import pandas as pd

file = Path('./datasets/Partidas.csv')
filePre = Path('./datasets/preguntasPartida.csv')

df_partidas = pd.read_csv(file) # leo csv
df_partidas['Fecha_Hora'] = pd.to_datetime(df_partidas['Fecha_Hora']) # cambio formato de la columna fecha hora


def calculo_puntaje(ultimo):
    '''
    Recibe datos de la ultima partida y calcula el puntaje de la misma
    '''

    if(ultimo['Dificultad']=="fácil"):
        ultimo["Puntaje"] = ultimo["Correctas"]
    elif(ultimo['Dificultad']=="media"):
        ultimo["Puntaje"] = ultimo["Correctas"]+(ultimo["Correctas"]/2)
    else:
        ultimo["Puntaje"] = ultimo["Correctas"]*2
    df_partidas.iloc[-1] = ultimo # guardo modificacion
    df_partidas.to_csv(file,index=False) # actualizo csv

def mostrar_ranking():
    '''
        ordena el archivo de partidas segun puntaje, resetea los indices y lo muestra
    '''
    url_gif = 'https://raw.githubusercontent.com/martimartineez/martimartineez/main/Facu.gif'
    
    df_modificado = df_partidas.sort_values(by='Puntaje', ascending=False) # ordeno de mayor a menor segun puntos
    df_modificado = df_modificado.reset_index(drop=True) # reseteo el indice
    st.title("Ranking de partidas")
    st.dataframe(df_modificado[['Usuario','Puntaje']].head(15),hide_index=True,width=800) # muestro primeros 15
    st.image(url_gif, width=100)
    return df_modificado

def mostrar_imagen(indice):
    '''
        dependiendo la posicion en el rankin muestra una imagen
    '''
    if(indice==1):
        ruta_imagen = 'https://raw.githubusercontent.com/martimartineez/images/main/yea.png'
        st.image(ruta_imagen, caption='Sos el top 1!', width=200)
    elif(indice<=3):
        ruta_imagen = 'https://raw.githubusercontent.com/martimartineez/images/main/nerdd.png'
        st.image(ruta_imagen, caption='Estas en el top 3!', width=200)
    elif(indice<=15):
        ruta_imagen = 'https://raw.githubusercontent.com/martimartineez/images/main/bien.png'
        st.image(ruta_imagen, caption='Estas en el top 15!', width=200)
    elif(indice>15):
        ruta_imagen = 'https://raw.githubusercontent.com/martimartineez/images/main/sad.png'
        st.image(ruta_imagen, caption='Segui participando', width=200)

def llegoDeJuego():
    '''
        al llegar de una partida, calcula el puntaje final, muestra el ranking, las preguntas de la partida,
        el desempeño del jugador y la posicion en el ranking del juego
    '''
    st.session_state.pasePor3=False
    
    ultimo = df_partidas.iloc[-1] # tomo el ultimo elemento del archivo (actual)
    calculo_puntaje(ultimo) # calculo el puntaje y lo guarda
    df_modificado = mostrar_ranking() # ordeno de mayor a menor puntaje y muestro ranking

    st.header("Partida actual")
    
    st.header("Desempeño de "+ultimo['Usuario'])
    st.subheader("Correctas: "+str(ultimo['Correctas']))
    st.subheader("Puntaje: "+str(ultimo['Puntaje'])) 
    
    
    fecha=ultimo['Fecha_Hora'] # obtengo la fecha de ultima partida
    indice=df_modificado.loc[df_modificado['Fecha_Hora']==fecha].index[0]+1
    st.subheader("Posicion en el ranking: "+str(indice))

    mostrar_imagen(indice)
    
    st.subheader("Preguntas realizadas")
    df_preguntas = pd.read_csv(filePre)
    st.dataframe(df_preguntas[['Pregunta','Respuesta','RespuestaUsuario']],hide_index=True,width=800) # muestro las preguntas de partida




num_filas = df_partidas.shape[0]

# si el archivo de partidas tiene datos entro a operar

if(num_filas>0):
    # si vine de la pagina 3
    if ('pasePor3' in st.session_state and st.session_state.pasePor3):
    
        llegoDeJuego()
    else:
        mostrar_ranking() # ordeno de mayor a menor puntaje y muestro ranking
else:
    st.title('Nadie juguo una partida! ')
    ruta_imagen = 'https://raw.githubusercontent.com/martimartineez/images/main/pensando.png'
    st.image(ruta_imagen, width=500)
    

