import streamlit as st
from pathlib import Path
import pandas as pd
import clase
from datetime import datetime
import random



#from modulos.generadorPreguntas import generarPreguntas
#Se leen los csv
usuarios_csv = Path('datasets\Registros_Usuarios.csv')
csv_file  = Path('datasets\preguntasPartida.csv')
csv_partida =Path('datasets\Partidas.csv')

users_df = pd.read_csv(usuarios_csv)

if users_df.shape[0] > 0:
    usuarios = users_df['nombre_usuario'].tolist()
else:
    usuarios = []

usuarios.append('Registrar nuevo usuario')


def quitar_acentos(letra_con_acento):
    ''' 
    Este método recibe una cadena de texto y devuelve la misma cadena pero sin acentos.
    '''
    acentos = {
        'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
    }
    letra_con_acento=letra_con_acento.lower()
    letras_sin_acento = []

    for letra in letra_con_acento:
        letras_sin_acento.append(acentos.get(letra, letra))
    return ''.join(letras_sin_acento)

def procesarPreguntas(listPreguntas):
    """Se cargan en el csv las preguntas  junto con sus datos adicionales"""
    columnas = ['Pregunta','Respuesta','op','RespuestaUsuario']
    df = pd.read_csv(csv_file) if csv_file.exists() else pd.DataFrame(columns=columnas)# en caso de no existir solo se crea en la direccion
    df = pd.DataFrame(listPreguntas, columns = columnas)
    df.to_csv(csv_file, index= False, encoding= 'utf-8')
def addAleatorio(preg):
    """Si la respuesta no se encuentra en la lista de op, lo añadira en una poscion aleatoria"""
    #st.write(preg[2])
    if(not preg[1] in preg[2]):
        pos_al  = random.randint(0, len(preg[2]))
        preg[2].insert(pos_al, preg[1])
        
def preocesarPartida():
    "Datos importantes de la partida se guardan el  Partidas.csv"
    colum =['Fecha_Hora','Usuario','Dificultad','Temática','Correctas','Genero','Puntaje']
    cant = 0
    #for preg in preguntas:
       # if preg[1] == preg[2]:
            #cant += 1
    cant = sum(map(lambda preg: preg[1] == preg[3], st.session_state.preguntas))#Cuenta la cantidad de verdaderos
    #st.write(cant)
    genero = users_df.loc[users_df['nombre_usuario'] == st.session_state.user_name, 'genero'].iloc[0]    
    dato =[st.session_state.fecha_hora, st.session_state.user_name, st.session_state.dif,st.session_state.tema, cant,genero, 0]
    df_partida = pd.read_csv(csv_partida)
    up = pd.DataFrame([dato], columns=colum)
    df_partida = pd.concat([df_partida,up], ignore_index=True)
    df_partida.to_csv(csv_partida, index= False, encoding= 'utf-8')

def guardar_form(u, t, d):
    """Se guarda la info del formulario junto  el cambio del st.session...., para que no muestre mas el formulario"""
    st.session_state.fecha_hora = datetime.now()
    st.session_state.user_name = u
    st.session_state.tema = t
    st.session_state.dif = d
    st.session_state.form_submitted = True

    
def preguntasAct(lis):
    """Solo conserva la info para no perder las preguntas"""
    st.session_state.preguntas = lis   


# Ruta del archivo CSV de usuarios

# Cargar usuarios existentes
#Añadir la dificultad en un sesion statets 
#añadir a partida



#st.write(usuarios)


# Continuar con la configuración de la trivia
tematicas = ['...', 'Lagos', 'Censo 2022', 'Aeropuertos','Conectividad']
if 'form_submitted' not in st.session_state:
    st.session_state.form_submitted = False
if 'pasePor3'  not in st.session_state:#info para ir a la pagina de estadisticas
    st.session_state.pasePor3 = False 
if 'submitted_custionario' not in st.session_state:#Para no poder alterar el formulario una vez enviado
    st.session_state.submitted_custionario = False


if st.session_state.form_submitted:    
    st.warning('Para comenzar una nueva partida reinicie la pagina')#Si se invia el cuestionario y vuelvo te pedira que reinicies
else:
    with st.form(key = 'mi_formulario'):
            # Dropdown de selección de usuario
        st.subheader('Para comenzar con la trivia seleccione el usuario')
        usuario_seleccionado = st.selectbox('Usuario', options=usuarios)
        if  usuario_seleccionado and  usuario_seleccionado == 'Registrar nuevo usuario':
            st.switch_page("pages/04_Formulario_De_Registro.py")
        tema = st.selectbox('Temática del Juego', options=tematicas)
        dif = st.select_slider('Dificultad', options=['fácil', 'media', 'difícil'])
        is_bool = st.form_submit_button('Comenzar')
    if is_bool and usuario_seleccionado and tema != '...':
        
        cla = clase.constructor().crear(tema)#se elige segun el tema que sub clase usar
        preguntas = cla.generar()
        preguntasAct(preguntas)
        guardar_form(u = usuario_seleccionado,t = tema, d = dif)

if st.session_state.form_submitted and  not st.session_state.submitted_custionario:#Oculta el formulaario cuanado se envia
        tema = st.session_state.tema
       
        #usango un def comun pra todas las sub clases genero la pregunta
        if (tema != '...'):
            #st.write(preguntas)
            st.header(f'Comenzando la trivia para {st.session_state.user_name}')
            st.subheader(f'Dificultad: {st.session_state.dif}')

            with st.form(key = 'Primera'):
                st.subheader('Primera pregunta')
                st.write(f'Tema: {tema}')
                st.write(st.session_state.preguntas[0][0])
                if(st.session_state.dif == 'fácil'):
                    addAleatorio(preg = st.session_state.preguntas[0])
                    res1 = st.selectbox('Respuesta 1', options= st.session_state.preguntas[0][2])
                elif(st.session_state.dif == 'media'):
                    st.text('Ayuda:')
                    st.write(f'La respuesta tiene {len(str(st.session_state.preguntas[0][1]))}caracteres incluidos los espacios')
                    res1 = st.text_input('Respuesta 1', placeholder='...')
                else:
                    res1 = st.text_input('Respuesta 1', placeholder='...')

                st.markdown('<hr>', unsafe_allow_html=True)

                st.subheader('Segunda pregunta')
                st.write(f'Tema: {tema}')
                st.write(st.session_state.preguntas[1][0])
                if(st.session_state.dif == 'fácil'):
                    addAleatorio(preg = st.session_state.preguntas[1])
                    res2 = st.selectbox('Respuesta 2', options= st.session_state.preguntas[1][2])
                elif(st.session_state.dif == 'media'):
                    st.text('Ayuda:')
                    st.write(f'La respuesta tiene {len(str(st.session_state.preguntas[1][1]))} caracteres incluidos los espacios')
                    res2 = st.text_input('Respuesta 2', placeholder='...')
                else: 
                    res2 = st.text_input('Respuesta 2', placeholder='...')

                st.markdown('<hr>', unsafe_allow_html=True)

                st.subheader('Tercera pregunta')
                st.write(f'Tema: {tema}')
                st.write(st.session_state.preguntas[2][0])
                if(st.session_state.dif == 'fácil'):
                    #if not st.session_state.preguntas[2][1] in st.session_state.preguntas[2][2]:
                        #(st.session_state.preguntas[2][2]).append(st.session_state.preguntas[2][1])
                    addAleatorio(preg = st.session_state.preguntas[2])
                    res3 = st.selectbox('Respuesta 3', options= (st.session_state.preguntas[2][2]))
                elif(st.session_state.dif == 'media'):
                    st.text('Ayuda:')
                    st.write(f'La respuesta tiene {len(str(st.session_state.preguntas[2][1]))} caracteres incluidos los espacios')
                    res3= st.text_input('Respuesta 3', placeholder='...')
                else:
                    res3= st.text_input('Respuesta 3', placeholder='...')

                st.markdown('<hr>', unsafe_allow_html=True)    

                st.subheader('Cuarta pregunta')
                st.write(f'Tema: {tema}')
                st.write(st.session_state.preguntas[3][0])
                if(st.session_state.dif == 'fácil'):
                    addAleatorio(preg = st.session_state.preguntas[3])
                    res4 = st.selectbox('Respuesta 4', options= st.session_state.preguntas[3][2])
                elif(st.session_state.dif == 'media'):
                    st.text('Ayuda:')
                    st.write(f'La respuesta tiene {len(str(st.session_state.preguntas[3][1]))} caracteres incluidos los espacios')
                    res4 = st.text_input('Respuesta 4', placeholder='...') 
                else:
                    res4 = st.text_input('Respuesta 4', placeholder='...')  

                st.subheader('Quinta pregunta')
                st.write(f'Tema: {tema}')
                st.write(st.session_state.preguntas[4][0])
                if(st.session_state.dif == 'fácil'):
                    addAleatorio(preg = st.session_state.preguntas[4])
                    res5 = st.selectbox('Respuesta 5', options= st.session_state.preguntas[4][2])
                elif(st.session_state.dif == 'media'):
                    st.text('Ayuda:')
                    st.write(f'La respuesta tiene {len(str(st.session_state.preguntas[4][1]))} caracteres incluidos los espacios')
                    res5 = st.text_input('Respuesta 5', placeholder = '...')
                else:
                    res5 = st.text_input('Respuesta 5', placeholder = '...')
                isCont = st.form_submit_button('Responder')
            if isCont and res1 and res2 and res3 and res4 and res5:#Si todas las casillas estan completas
                st.session_state.submitted_custionario = True
                st.session_state.pasePor3 = True
                #Se añade en orden de pregunta al csv
                st.session_state.preguntas[0].append((quitar_acentos(str(res1))).strip())
                st.session_state.preguntas[1].append((quitar_acentos(str(res2))).strip())
                st.session_state.preguntas[2].append((quitar_acentos(str(res3))).strip())
                st.session_state.preguntas[3].append((quitar_acentos(str(res4))).strip())
                st.session_state.preguntas[4].append((quitar_acentos(str(res5))).strip())
                procesarPreguntas(st.session_state.preguntas)
                preocesarPartida()
                st.switch_page("pages/05_Ranking.py")
               
                

