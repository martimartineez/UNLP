from pathlib import Path
import csv
import quitar_acentos

file_airports=Path('.') / 'datasets' / 'ar-airports.csv'
file_provinces=Path('.') / 'datasets' / 'ar.csv'

def abrirFileAirports():
     with open(file_airports,'r',encoding='utf-8') as file:
         ''' 
         abre el archivo y solo nos quedamos con los datos de los aeropuertos, sin el encabezado, concatenados y separados por ', '
         '''
         reader=csv.reader(file, delimiter=',')
         next(reader)
         airports= list(reader)
     return airports

def abrirFileProvinces():
     with open(file_provinces,'r',encoding='utf-8')as file:
         '''
           abre el archivo y solo nos quedamos con los datos de las provincias, sin el encabezado, concatenados y separados por ', ' 
           '''
         reader=csv.reader(file, delimiter=',')
         next(reader)
         provincia= list(reader)
     return provincia;


#5
def capitalesprovincias(provincias):
     ''' 
     en este metodo solo nos quedamos con las capitales de cada provincia, en donde hay excepciones como cada y viedma
     '''
     list= set()
     for dato in provincias:
         if dato[6] == 'admin' or dato[6] == 'primary':#si es capital
             valor=quitar_acentos(dato[0])
             if valor == 'Viedma':
                  list.add("Viedma / Carmen de Patagones")# lo pongo porque es el unico que lo pide
             else:    
                 list.add(valor)#tomamos la ciudad         
     return list



def crear(aeropuertos, list_capitales):
     ''' 
     aca recibimos los aeropuertos y la lista de capitales, creamos el diccionario con los aerpuertos que solo estan en las capitales de cada aprovincia
     en donde la clave es el nombre de la capital y el valor los nombres de los aeropuertos
     luego voy iterando por cada capital, y en cada capital tambien iteramos por los aeropueertos y de ahi verificamos si el aeropuerto esta en una capital 
     '''
     diccionario_aeropuertos = {}
     for capital in list_capitales:  
         for aeropuerto in aeropuertos:
             valor = quitar_acentos(aeropuerto[13]) #nombre de la municipalidad del aerpuerto
             # Si el municipio del aeropuerto coincide con la capital en la que estamos ahora
             if valor == capital : 
                 diccionario_aeropuertos.setdefault(capital, []).append(aeropuerto[3])# Agregar el nombre del aeropuerto a la lista

                 #hacer esto de abajo en las misma linea es lo mismo que hacer lo de arriba
                # aeropuertos_capital.add(aeropuerto[3])  # Agregar el nombre del aeropuerto a la lista
        # diccionario_aeropuertos[capital] = list(aeropuertos_capital)  # Agregar la lista de aeropuertos al diccionario, la clave es el nombre de la capital
        # aeropuertos_capital = set()
     return diccionario_aeropuertos

def mostraraeropuertos(diccionario):
     ''' 
     Recorro el diccionario e imprimo sus claves,valores
     '''

     for clave,valor in diccionario.items():
         print(clave,valor)
         print('-----------------------------')


def main():
     ''' 
     se abren los archivos de aeropuertos y provincias y los gurado en una lista
     luego en una lista guardamos las capitales de cada provincia 
     creamos un diccionario con las capitales de cada provincia, en donde le pasamos la lista de aeropuertos y la lsita de capitales de cada provincia
     mostramos el resultado 
     '''
     aeropuertos= abrirFileAirports()
     provincias= abrirFileProvinces()
    
     listaprovinciiascapitales=capitalesprovincias(provincias)
     
     diccionario_aeropuertos=crear(aeropuertos,listaprovinciiascapitales)
     mostraraeropuertos(diccionario_aeropuertos)               