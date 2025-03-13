from pathlib import Path
import csv

file_direction=Path('.') / 'datasets' / 'Conectividad_Internet.csv'

def abrirFile():
    '''abre el archivo, guarda los nombres de las columnas en header y la info restante en datos'''

    with open(file_direction, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        header=next(reader)
        datos= list(reader)
    return header[4:13],datos

def armar(header,datos):
    '''arma un diccionario que posee de clave cada tipo de conectividad, recorre los datos viendo
        las localidades(se asume que no se repite la misma provincia/localidad) y si estas tienen alguna(s) conectividad(es), se suma uno en
        el valor de la clave con nombre de dicha(s) conectividad(s)'''
    

    dicc=dict.fromkeys(header,0) #correcion

    for dato in datos:
        for i,pos in enumerate(dato[4:13]):
                if pos =='SI':
                    dicc[header[i]]+=1
    return dicc

def imprimir(dicc):
    '''imprime el contenido del diccionario, nombre de clave y su valor '''

    print('mostrando la cantidad de localidades por cada tipo de conectividad: ')
    for clave, valor in dicc.items():
        print(clave,valor)

def mostrarCantidadPorTipos():
    '''abre el archivo guarda los titulos en header y el resto en datos, arma un diccionario que cada
        clave es un tipo de conectividad y su valor es cuantas localidades la poseen '''
    
    header,datos=abrirFile()
    dicc=armar(header,datos)
    imprimir(dicc)

                    



    