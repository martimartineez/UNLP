from pathlib import Path
import csv

file_direction=Path('.') / 'datasets' / 'Conectividad_Internet.csv'

def abrirFile():
    '''abre el archivo, guarda los nombres de las columnas en header y la info restante en datos'''

    with open(file_direction, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        header=next(reader)
        datos= list(reader)
    return header,datos

def cambiarCarateresANo(datos):
    ''' recibe los datos del archivo, lo recorre y cambia los caracteres -- por NO'''

    for linea in datos:
        for i, dato in enumerate(linea):
            if dato == '--':
                linea[i] = 'NO'


def agregarColumna(header,datos):
    '''si no existe la columna posee_conectividad, la genera'''

    if 'posee_conectividad' not in header:
        header.append('posee_conectividad')
        for linea in datos:
            linea.append("")


def completarColumna(datos):
    '''toma la columna posee_conectividad, si la localidad analizada NO posee NINGUN tipo de conectividad,
        se agrega NO a la columna, sino se agrega SI'''
    
    for linea in datos:
        if(all(map(lambda x: x=='NO',linea[4:13]))):
            linea[16]='NO'
        else:
            linea[16]='SI'

def cargarEnFile(completo):
    '''recibe el header y datos combinados en la lista completo y los cargo en el archivo iterando
      en la lista'''

    with open(file_direction, 'w',encoding='utf-8',newline='') as file:
        writer= csv.writer(file)
        writer.writerows(completo)


def upDateFile():
    '''Abre el archivo, cambia los -- a NO, generacoluma posee_conectividad,
        completa la columna segun criterio, carga las modificaciones al mismo archivo.
    '''
    
    header,datos=abrirFile()
    cambiarCarateresANo(datos)
    agregarColumna(header,datos)
    completarColumna(datos)
    completo=[header]+datos
    cargarEnFile(completo)


