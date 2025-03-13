from pathlib import Path
import csv
from consultas import quitar_acentos


file_direction=Path('.') / 'datasets' / 'Conectividad_Internet.csv'
file_direction2=Path('.') / 'datasets' / 'ar.csv'

def abrirFileInternet():
    '''abre el archivo, guarda  la info en datos'''

    with open(file_direction, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        next(reader)
        datos= list(reader) 
    return datos

def abrirFileCiudades():
    '''abre el archivo, guarda la info que necesito separada en ciudades y provincias y las retorno,
        tambien la primer provincia del archivo la nombro de caba para normalizar los datos que tengo que
        comparar 
    '''

    with open(file_direction2, 'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        next(reader)
        datos= list(reader)
        ciudades=[]
        provincias=[]
        for dato in datos:
            ciudades.append(dato[0])
            provincias.append(dato[5])
        provincias[0]="caba"
    return ciudades,provincias


def formatearDatos(datos,provincias,ciudades):
    ''' Recibe datos de internet y provincias, filtro las provincias/ciudades de ambas estructuras, dejandolas con el mismo formato
    en minusculas y sin acentos, a su vez en datos todos los lugares de caba le pongo Buenos Aires como nombre
    de ciudad para que coincidan los datos a analizar.
    '''

    for dato in datos: #filtro datos de archivo internet
        dato[0]=quitar_acentos.quitar_acentos(dato[0]) #pongo en minusculas y sin acentos las provincias de datos
        if dato[0]=='caba':
            dato[2]='buenos aires' #normalizo que todo lo que esta en la provincia caba, esta en la ciudad Buenos Aires. Lo deje con mayus y un acento en í para ver si filtraba bien a  minusculas sin acentos
        dato[2]=quitar_acentos.quitar_acentos(dato[2]) #pongo en minusculas y sin acentos las localidades de datos        


    for i, (prov,ciudad) in enumerate(zip(provincias,ciudades)): #uso enumerate porq son dos listas que en la misma posicion tienen datos relacionados(provincia/ciudad)
        provincias[i]=quitar_acentos.quitar_acentos(prov) #pongo en minusculas y sin acentos las provincias
        ciudades[i]=quitar_acentos.quitar_acentos(ciudad) #pongo en minusculas y sin acentos las ciudades


def armarDicc(datos):
    ''' Armo un diccionario que tiene de claves todas las provincias y un valor por defecto 
    '''
    
    provincias=set(dato[0]for dato in datos)#tomo las provincias

    dicc=dict.fromkeys(provincias,'tiene fibra optica en todas las ciudades.') 
    return dicc

def filtrar(dicc,datos,ciudades,provincias):
    ''' tomo los datos ya formateados, el diccionario y comparo, recorriendo los datos, verifico que 
        sea una provicia que esta en el diccionario, que sea una ciudad de las especificadas, y que efectivamente 
        sea dicha ciudad y provincia, luego si no cumple con lo pedido se elimina del diccionario la provincia
        retorando un diccionario solo con las provincias que cumplen
    '''

    for dato in datos:
        if (dato[0] in dicc): #verifico que todavia sea una prov valida y sea una ciudad valida
            for ciudad in ciudades:
                if((ciudad in dato[2]) or (dato[2] in ciudad)): #Me fijo si son la misma ciudad, si es false son diferentes
                    pos=ciudades.index(ciudad) #tomo la posicion de la ciudad en la lista, para buscar su provincia en la otra lista
                    if((provincias[pos] in dato[0]) or (dato[0] in provincias[pos])):#Me fijo lo mismo con las provincias para ver si son la misma
                        if dato[7]=='NO':
                            del dicc[dato[0]] #si no tiene fibra una ciudad elimino la provincia del diccionario
    
    return dicc

def imprimirDiccionario(dicc):
    ''' Recorro el diccionario e imprimo sus claves,valores
    '''

    for clave,valor in dicc.items():
        print(clave,valor)


def mostrarProvinciasConFibraOptica():
    ''' Se abre el archivo de Conectividad de internet y se guarda la info en datos, lo mismo 
        con el archivo de ar.csv, donde me quedo con las ciudadaes y sus provincias, luego
        armo un diccionario de todas las provincias de arg, luego lo filtro dejando solo las provincias
        que tengan fibra optica en todas las ciudades especificadas en ar.csv de dicha provincia y muestro
        el resultado
    '''

    datos=abrirFileInternet()
    ciudades,provincias=abrirFileCiudades()
    formatearDatos(datos,provincias,ciudades)
    dicc=armarDicc(datos)
    dicc=filtrar(dicc,datos,ciudades,provincias)
    imprimirDiccionario(dicc)