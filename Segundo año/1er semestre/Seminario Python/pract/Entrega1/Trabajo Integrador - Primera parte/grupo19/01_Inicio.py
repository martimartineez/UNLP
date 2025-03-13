import streamlit as st

def pagina_inicio():
    # Título de la página
    st.title("Bienvenidos a PyTrivia")

    # Breve descripción del juego
    st.header("¿Qué es PyTrivia?")
    st.markdown("""
    PyTrivia es un emocionante juego de preguntas y respuestas donde puedes poner a prueba tus conocimientos en diversas categorías. 
    Compite contra ti mismo o con amigos para ver quién sabe más. ¡Diviértete mientras aprendes!
    """)

    # Datos necesarios para comenzar a jugar
    st.header("Datos Necesarios para Comenzar a Jugar")
    st.markdown("""
    - **Nombre de Usuario**
    - **Correo Electrónico**
    - **Fecha de Nacimiento**
    - **Género**
    """)

    # Instrucciones básicas para jugar
    st.header("Instrucciones Básicas para Jugar")
    st.write('**1- Registro**: Si eres un nuevo jugador, regístrate proporcionando tu información necesaria.')
    if st.button("Registro"):
        st.write("Ir a la página de inicio de sesión")
        st.switch_page("pages/04_Formulario_De_Registro.py")
    st.write('**2- Iniciar sesión**: Si ya tienes una cuenta, indica tu nombre de usuario y juega.')
    st.markdown("""
    **3- Seleccionar la Temática del juego**: Elige la categoría de preguntas que más te interese.
                
    **4- Seleccionar Dificultad**: Escoge el nivel de dificultad de las preguntas (fácil, media, difícil).
                
    **5- Responder Preguntas**: Lee la pregunta y selecciona la respuesta correcta entre las opciones o escribe la respuesta dependiendo de la dificultad.
    """)
    if st.button("Juego"):
        st.write("Ir a la selección de categoría")
        st.switch_page("pages/03_Juego.py")
    st.write('**6- Ver Resultados**: Al final de la ronda, revisa tus respuestas y puntaje.')
    if st.button("Ranking"):
        st.write("Ir a la selección de categoría")
        st.switch_page("pages/05_Ranking.py")

    # Explicación del parámetro de dificultad en el juego
    st.header("Funcionamiento del Parámetro de Dificultad")
    st.markdown("""
    Ajusta el nivel de dificultad de las preguntas para adaptarse a tu experiencia y conocimiento:
    - **Fácil**: Preguntas de la temática elegida con opciones de selección múltiple, las respuestas correctas no suman puntos adicionales.
    - **Media**: Preguntas con una pista sin opciones, las respuestas correctas suman la mitad de puntos.
    - **Difícil**: Preguntas sin ninguna ayuda, las respuestas correctas duplican el puntaje.
    
    Escoger la dificultad adecuada te ayudará a tener una experiencia divertida y estimulante 😊.
    """)

    # Detalles adicionales útiles
    st.header("Detalles Adicionales")
    st.markdown("""
    - **Respuestas**: Las respuestas no deben tener espacios al inicio y/o al final.
    - **Registro**: Si se desea agregar un nombre de usuario nuevo, se debe dejar marcado "Registrar nuevo usuario" y presionar "Comenzar".
    - **Usuarios**: No se pueden tener nombres de usuario ni correos electrónicos repetidos.
    """)

pagina_inicio()
