from pathlib import Path
import csv

file_direction=Path('.') / 'datasets' / 'Conectividad_Internet.csv'

def abrirFile():
    '''abre el archivo y guarda los titulos de las columnas en header'''

    with open(file_direction, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        header=next(reader)
    return header[4:13]

def mostrarTiposConectividades():
    '''abre el archivo, guarda en header los nombre de columnas, toma del header solo los nombres
        de conectividades y los imprime '''
    
    header= abrirFile()
    print('los tipos de conectividad son: ')
    for i in header:
        print(i)