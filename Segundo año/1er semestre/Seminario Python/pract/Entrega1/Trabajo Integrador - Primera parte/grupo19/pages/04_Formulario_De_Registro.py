import streamlit as st
import pandas as pd
from datetime import date
from pathlib import Path

# Ruta del archivo CSV
csv_file = Path('./datasets/Registros_Usuarios.csv')

def procesarDatos(lista):
    ''' 
    Procesa los datos del formulario de registro y los guarda en un archivo CSV.
    Si el correo ya está registrado, actualiza los datos existentes.
    Si el correo no está registrado, agrega una nueva entrada al archivo CSV.
    '''
    # Definir las columnas esperadas
    columnas = ['nombre_usuario', 'nombre_completo', 'correo', 'fecha_nacimiento', 'genero']
    # Leer el archivo CSV en un DataFrame
    df = pd.read_csv(csv_file)
    # Convertir la lista a un DataFrame con las columnas adecuadas
    nuevo_registro = pd.DataFrame([lista], columns=columnas)
    # Extraer información del nuevo registro
    correo = lista[2]
    nombre_usuario = lista[0]
    # Verificar si el correo ya está registrado
    if correo in df['correo'].values:
        # Si el nombre de usuario asociado al correo no existe y el nombre de usuario existe con otro correo salta el error
        if nombre_usuario != df.loc[df['correo'] == correo, 'nombre_usuario'].values[0] and nombre_usuario in df['nombre_usuario'].values:
            st.session_state['error_usuario'] = "El nombre de usuario ya está registrado. Por favor, elige otro nombre de usuario."
            return False  # Devolver False si hay un error
        # Actualizar los datos existentes para el usuario con el mismo correo
        df.loc[df['correo'] == correo, columnas] = lista
    else:
        # Verificar si el nombre de usuario ya está registrado
        if nombre_usuario in df['nombre_usuario'].values:
            st.session_state['error_usuario'] = "El nombre de usuario ya está registrado. Por favor, elige otro nombre de usuario."
            return False  # Devolver False si hay un error

        # Agregar la nueva fila al DataFrame si el correo no está registrado
        df = pd.concat([df, nuevo_registro], ignore_index=True)

    # Guardar los cambios en el archivo CSV
    df.to_csv(csv_file, index=False, encoding='utf-8')
    
    # Eliminar cualquier error previo después de un registro exitoso
    if 'error_usuario' in st.session_state:
        del st.session_state['error_usuario']
    
    return True  # Devolver True si el proceso fue exitoso

def mostrar_formulario_registro():
    '''
    Esta función muestra un formulario interactivo para que los usuarios se registren. Cuando el usuario
    completa todos los campos y presiona el botón "Enviar", se valida la información. Si todos los campos están
    completos y no hay errores (como nombres de usuario o correos duplicados), el formulario se envía con éxito y los datos
    se procesan para almacenamiento. Luego, se redirige al usuario a la página de juego. Si falta algún campo o hay
    un nombre de usuario o correo duplicado, se muestra un mensaje de error.
    '''
    st.title("Formulario de registro")

    # Mostrar mensaje de error si existe
    if 'error_usuario' in st.session_state:
        st.error(st.session_state['error_usuario'])

    with st.form(key='formulario_registro'):  # Inicio del formulario y solicitud de datos
        nombre_usuario = st.text_input("Nombre de usuario")
        nombre_completo = st.text_input("Nombre completo")
        correo = st.text_input("Correo electrónico")
        fecha_nacimiento = st.date_input("Fecha de nacimiento", min_value=date(1900, 1, 1), max_value=date.today())
        genero = st.selectbox("Género", ["Masculino", "Femenino", "Otro", "Prefiero no decir"])
        
        if st.form_submit_button("Enviar"):  # Verificar si se han completado todos los campos
            if nombre_usuario and nombre_completo and correo and fecha_nacimiento and genero:
                # Convertir la fecha a formato ISO para almacenamiento consistente
                fecha_nacimiento_str = fecha_nacimiento.strftime('%Y-%m-%d')
                datos_usuario = [nombre_usuario, nombre_completo, correo, fecha_nacimiento_str, genero]
                
                if procesarDatos(datos_usuario):  # Procesar los datos del usuario
                    # Limpiar el estado del error después de un registro exitoso
                    if 'error_usuario' in st.session_state:
                        del st.session_state['error_usuario']
                    st.success("Registro exitoso! Redirigiendo al juego...")
                    # Redirigir a la página de juego
                    st.switch_page("pages/03_Juego.py")
                else:
                    st.experimental_rerun()
            else:
                st.error("Por favor, completa todos los campos.")  # Mostrar mensaje de error si faltan campos

# Mostrar el formulario en la aplicación Streamlit
mostrar_formulario_registro()