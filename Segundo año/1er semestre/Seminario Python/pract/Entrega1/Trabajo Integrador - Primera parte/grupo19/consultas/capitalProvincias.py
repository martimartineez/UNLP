from pathlib import Path
import csv
from consultas import quitar_acentos
file_direction=Path('.') / 'datasets' / 'Conectividad_Internet.csv'
file_direction2=Path('.') / 'datasets' / 'ar.csv'

def abrirFileInternet():
    '''abre el archivo, guarda los nombres de las columnas en header y la info restante en datos'''

    with open(file_direction, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        next(reader)
        datos= list(reader)
    return datos

def abrirFileCiudades():
    '''abre el archivo, guarda los nombres de las columnas en header y la info restante en datos'''

    with open(file_direction2, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        next(reader)
        datos= list(reader)
        datos[0][5]='caba'
    return datos

def formatearDatos(datosInternet,datosCiudades):
    ''' Recibe datos de internet y los del archivo ciudades, filtro las provincias/ciudades de ambas estructuras, dejandolas con el mismo formato
    en minusculas y sin acentos, a su vez en datos todos los lugares de caba le pongo Buenos Aires como nombre
    de ciudad para que coincidan los datos a analizar.
    '''

    for dato in datosInternet: #filtro datos de archivo internet
        dato[0]=quitar_acentos.quitar_acentos(dato[0]) #pongo en minusculas y sin acentos las provincias de datos
        if dato[0]=='caba':
            dato[2]='buenos aires' #normalizo que todo lo que esta en la provincia caba, esta en la ciudad Buenos Aires. Lo deje con mayus y un acento en í para ver si filtraba bien a  minusculas sin acentos
        dato[2]=quitar_acentos.quitar_acentos(dato[2]) #pongo en minusculas y sin acentos las localidades de datos        


    for dato in datosCiudades: #filtro datos de archivo de ciudades
        dato[5]=quitar_acentos.quitar_acentos(dato[5]) #pongo en minusculas y sin acentos las provincias
        dato[0]=quitar_acentos.quitar_acentos(dato[0]) #pongo en minusculas y sin acentos las ciudades




def procesar(datosInternet,datosCiudades):
    ''' recibo los datos de internet y ciudades, filtro todas las provincias y su capitales
    creo un diccionaro con esto filtrado, y lo midifico si es posible encontrar la ciudad en
    el archivo de internet 
    '''  
    
    ProvinciaCapitales=filter(lambda x: x[6]=='admin' or  x[6]=='primary',datosCiudades)#me quedo con los datos que tienen las capitales

    dicc={provincia[5]: [provincia[0], 'conectividad desconocida'] for provincia in ProvinciaCapitales}
    
    #arme el diccionario con todas las provincias y sus capitales, siendo la clave el nombre de prov y el valor la capital seguido de conectividad desconocida

    for dato in datosInternet:
        for clave in dicc:
            if((clave in dato[0] or dato[0]in clave) and (dicc[clave][0] in dato[2] or dato[2] in dicc[clave][0])): #si son la misma provincia y ciudad
                dicc[clave][1]=dato[16] #actualizo segundo valor de la lista del diccionario 
    

    return dicc


def imprimirDiccionario(dicc):
    ''' Recorro el diccionario e imprimo sus claves,valores
    '''

    for clave,valor in dicc.items():
        print(clave,valor)

def mostrarCapitales():
    ''' abro ela archivo de internet y guardo los datos en datosInternet, 
        lo mismo con el archivo ar.csv en datosCiudades, formateo los datos para que sean lo mas
        compatibles posible, armo un diccionario con las provincias, sus capitales
        y si tiene conectividad, luego imprimo el resultado
    '''

    datosInternet=abrirFileInternet()
    datosCiudades=abrirFileCiudades()
    formatearDatos(datosInternet,datosCiudades)
    dicc=procesar(datosInternet,datosCiudades)
    imprimirDiccionario(dicc)


