from consultas import brechaHombreMujer,cantLocalidesPorTipos,capitalProvincias,ls5MayorPor,mostrarAreopuertosdeCapitales,mostrarLagos,provinciasConFibraOptica, tiposAeropuertos,tiposConectividades,consulta4
"""Muestra los diferentes tipos de aeropuertos """
def opcion_1():
    tiposAeropuertos.filtrarTiposAirports()   
"""Muestra los aeropuertos para un tipo de eliminación"""
def opcion_2():
    tiposAeropuertos.ImrimirTipoElevacion(int(input('Ingresar una elevación ordinal')))
"""Muestra los aeropuertos que tienen una mayor o menor altura con respecto  a un dato dado"""
def opcion_3():
    tiposAeropuertos.filtrarMayoroMenorElevacion(int(input('Ingresar una elevación')))
"""La función imprime los lagos, aeropuertos  y el tipo de conectividad 
    en las provincias con una población  mayor o menor  a un valor """
def opcion_4():
    consulta4.main()
"""Se imprime los aeropuertos que se encuentran en la capital de cada provincia """
def opcion_5():
    mostrarAreopuertosdeCapitales.main()
"""Dada una superficie la función te muestra cual lago coincide con esa superficie """
def opcion_6():
    mostrarLagos.MostrarLagos(input("Diga que tamaño de lagos quiere, 1 para Bajo, 2 para Medio, 3 para Grande"))
"""Se listan las jurisdicciones con mayor porcentaje de población en situación de calle """
def opcion_7():
    ls5MayorPor.listMayor5()
"""Se evalúa cual es la jurisdicción con la mayor brecha entre la población según su sexo"""
def opcion_8():
    brechaHombreMujer.brechaMax()
"""Se muestran los diferentes tipos de conectividad """
def opcion_9():
    tiposConectividades.mostrarTiposConectividades()
"""Se muestran la cantidad de localidades con cada tipo de conectividad """
def opcion_10():
    cantLocalidesPorTipos.mostrarCantidadPorTipos()
"""Muestras todas las provincias  para las cuales todas sus ciudades poseen fibra óptica """
def opcion_11():
    provinciasConFibraOptica.mostrarProvinciasConFibraOptica()
"""La función se encarga de mostrar par cada provincia su capital, si se conoce la información, además informara si posee conectividad """
def opcion_12():
    capitalProvincias.mostrarCapitales()
opciones = {
    '1' : opcion_1,
    '2' : opcion_2,
    '3' : opcion_3,
    '4' : opcion_4,
    '5' : opcion_5,
    '6' : opcion_6,
    '7' : opcion_7,
    '8' : opcion_8,
    '9' : opcion_9,
    '10' : opcion_10,
    '11' : opcion_11,
    '12' : opcion_12
}
"""Esta función solo se encarga de imprimir la interface del menú básico"""
def mostrarMenu():
    print('1 Para mostrar los diferentes tipos de aeropuertos')
    print('2 Para mostrar los aeropuertos de un tipo de elevación')
    print('3 Para mostrar los mayores o menores a una elevacion')
    print('4 Para mostrar Los aeropuertos, lagos y tipo de conectividad en provincias con población mayor o menor a un valor')
    print('5 Para mostrar los aeropuertos en las capitales de cada provincia')
    print('6 Para mostrar los Lagos de una superficie')
    print('7 Para listar las 5 Jurisdicciones con mayor porcentaje de población en situación de calle')
    print('8 Para Obtener la jurisdicción donde la brecha entre las poblaciones diferenciadas según sexo registrado al nacer es mayor')
    print('9 Para mostrar los diferentes tipos de conectividades.')
    print('10 Para mostrar las cantidades de localidades con cada tipo de conectividad')
    print('11 Para mostrar las provincias para las cuales todas sus ciudades poseen FIBRA ÓPTICA.')
    print('12 Para mostrar para cada provincia su capital y, si se conoce la información para dicha capital, informar si posee conectividad ')
    print('13 Para salir del menu')
    print('||||||||||||||||')

"""La función utiliza un bucle infinito para que se puedan implementar otras opciones del menú, utilizando para ello, el diccionario de opciones"""
def menu():
    mostrarMenu()
    while True:
        opcion= input("Seleccione una opcion: ")
        if opcion!='13':
            opciones.get(opcion,lambda: print('opcion invalida'))()
        else: break