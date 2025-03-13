from pathlib import Path
import csv
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'consultas')))
import quitar_acentos

file_airports=Path('./datasets/ar-airports.csv')
file_provinces=Path('./datasets/ar.csv')

def abrirFileAirports():
    '''    
    Función que abre el archivo ar-airports.csv para leer el encabezado y guardar el resto de las líneas en listas.
    Devuelve el encabezado y las líneas restantes como variables para su posterior modificación.
    '''
    with open(file_airports,'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        header=next(reader)
        airports= list(reader)
    return header,airports

def abrirFileProvinces():
    '''
    Función que abre el archivo ar.csv y guarda las ciudades como claves y las provincias como valor en una variable de tipo diccionario. 
    Luego, se puede acceder a este diccionario utilizando las ciudades como claves para obtener las provincias correspondientes.
    '''
    localidades=[]
    with open(file_provinces,'r',encoding='utf-8')as file:
        reader=csv.DictReader(file)
        for fila in reader:
            localidades.append((quitar_acentos.quitar_acentos(fila['city']),(fila['admin_name'])))
        localidades_dict=dict(localidades)
    return localidades_dict

def agregarElevation(header,airports):
    '''
    Función que agrega la columna elevation_name al header y al airports que corresponde al archivo ar-airports.csv.
    Esta nueva columna contiene una de tres opciones (bajo, medio, alto) según el grado de elevación del aeropuerto. 
    '''
    if ('elevation_name' not in header):
        header.append('elevation_name')
        for linea in airports:
            if(linea[6]!=''):
                if(int(linea[6])<=131):
                    linea.append('bajo')
                elif(int(linea[6])<=903):
                    linea.append('medio')
                else:
                    linea.append('alto')

def agregarProvince(localidades,header,airports):
    '''
    Función que agrega la columna prov_name al header y airports para guardar las provincias de cada aeropuerto 
    evaluando las ciudades en el archivo ar.csv para determinar la ubicación de cada aeropuerto.
    '''
    if ('prov_name' not in header):
        header.append('prov_name')
        for linea in airports:
            municipio = quitar_acentos.quitar_acentos(linea[13])
            if municipio in localidades:
                provincia = localidades[municipio]
                linea.append(provincia)
            else:
                linea.append('No encontrado')
            
def cargarEnFile(airports,header):
    '''
    Función que sobrescribe el archivo ar-airports.csv con las nuevas columnas procesadas.
    '''
    with open(file_airports, 'w',encoding='utf-8',newline='') as file:
        writer= csv.writer(file)
        writer.writerows([header])
        writer.writerows(airports)
    
def upDateFile():
    '''
    Función que procesa y modifica el archivo ar-airports.csv. Le agrega una columna llamada elevation_name 
    que contiene datos cualitativos que indican la elevación de cada aeropuerto, y una columna llamada prov_name, 
    donde se incluye el nombre de la provincia correspondiente a cada aeropuerto. 
    '''
    header,airports=abrirFileAirports()
    localidades=abrirFileProvinces()
    agregarElevation(header,airports)
    agregarProvince(localidades,header,airports)
    cargarEnFile(airports,header)