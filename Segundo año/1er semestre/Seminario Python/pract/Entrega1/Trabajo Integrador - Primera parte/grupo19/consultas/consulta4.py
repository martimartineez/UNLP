from pathlib import Path
import csv
import quitar_acentos

ruta_archivo = Path('.') / 'datasets' / 'lagos_arg.csv'
file_airports=Path('.') / 'datasets' / 'ar-airports.csv'
file_provinces=Path('.') / 'datasets' / 'ar.csv'
file_conectividad=Path('.') / 'datasets' / 'Conectividad_Internet.csv'

def abrirConectividad():
     with open(file_conectividad, 'r',encoding='utf-8') as file:
         '''
          abre el archivo nos quedamos con el encabezado y los datos de la conectividad, sin el encabezado, concatenados y separados por ', '
         '''
         reader=csv.reader(file, delimiter=',')
         header=next(reader)
         datos= list(reader)
     return header,datos

def abrirFileAirports():
     with open(file_airports,'r',encoding='utf-8') as file:
         '''
         abre el archivo y solo nos quedamos con los datos de los aeropuertos, sin el encabezado, concatenados y separados por ', '
         '''
         reader=csv.reader(file, delimiter=',')
         next(reader)
         airports= list(reader)
     return airports

def abrirarchivolagos():
     with open(ruta_archivo, "r", encoding='utf-8') as archivo:
         '''
         abre el archivo y solo nos quedamos con los datos de los lagos, sin el encabezado, concatenados y separados por ', '
         '''
         #csv.reader se utiliza para leer la fila de los archivos, y el delimitador es la coma
         csv_leer= csv.reader(archivo,delimiter=',')
         #usamos with para asignar y liberar recursos cuando se desee
         next(csv_leer)#lo que hace es saltearse la primer linea del archivo 
         #recorremos el archivo pero con csv_leer
         datos= list(csv_leer)
     return datos


def calcular_poblacion_provincias():
     '''
     abre el archivo y solo nos quedamos con los datos de las provincias, sin el encabezado, concatenados y separados por ', '
     aca creamos un dicciomnario que va a tener como clave el nombre de las provincias y su valior va a ser la poblacion total de cada provincia
     '''
     poblacion_provincias = {}
     with open(file_provinces, 'r', encoding='utf-8') as file:
         reader = csv.DictReader(file)
         next(reader)
         for fila in reader:
             provincia=quitar_acentos(fila['admin_name']).lower()
             poblacion_municipio = fila['population']

             if provincia == "buenos aires, ciudad autonoma de":
                 provincia = "buenos aires"

             #con set default, si  la clave provincia no esta, lo crea y lo inicializa con un valor en cero 
             if poblacion_municipio:
                 poblacion_provincias.setdefault(provincia, 0)           
                 poblacion_provincias[provincia] += int(poblacion_municipio)

             #poblacion_provincias[provincia] = poblacion_provincias.get(provincia, 0) + poblacion_municipio, creo que se puede hacer asi tambien, lo pregunto en clases


     return  poblacion_provincias


def sacarprov(provincias, poblacion, condicion):
     '''
     aca recibimos el diccionario de las provincias, la poblacion que nos va a delimitar y la condicion que nos va a indicar de que lado tomar los datos
     creamos un diccionario que la clave es el nombre de la provincia y la clave es la poblacion total de dicha provincia
     vamos iterando sobre la lista de las provincias y vemos cual cumple la condicion y la agregamos al diccionario
     '''

     lista = []
     poblacion=int(poblacion)
     for provincia in provincias:               
         poblacion_prov = int(provincias[provincia])    
         if (condicion == '>' and poblacion_prov > poblacion) or (condicion == '<' and poblacion_prov < poblacion):
             lista.append(provincia)
     return lista

def crear_diccionario_general(aeropuertos, lagos, lista_provincias):
     '''
     en este metodo nos pasan la lista de aeropuertos, lagos y la de las provinciuas que cumplen la condicion
     creamos un diccionario que va a tener como clave los aeropuertos(su valor es el nombre del aerpuerto ), lagos(su valor es el nombre del lago) y
      la de conectividad(sus valores los va a tomar el encabezado de la conectiuvidad, que se va a agregar solo si esta esa conexion en la localidad)

     en los 1er for, se itera sobre la lista de aeropuertos, y verifica si la ubicacion del aeropuerto esta en la lista de provincias que cumplen la condicion y 
     le agrega sus respectivos valores, si la provincia no esta en el diccionario la crea

     en el 2do for, se itera sobre la lista de lagos, y verifica si la ubicacion del lago esta en la lista de provincias que cumplen la condicion y le agrega sus respectivos 
     valores, si la provincia no esta en el diccionario la crea

     '''
     diccionario_general = {}

     for dato in aeropuertos:
         if len(dato) > 24:  # Verificar si el dato tiene al menos 25 elementos
             provincia = quitar_acentos(dato[24].lower()) #lo hago con el valor de la posicion 24 porque viene del
             if provincia in lista_provincias:  
                 #dat = quitar_acentos(provincia)
                 aeropuerto = dato[3]
                 diccionario_provincia = diccionario_general.setdefault(provincia, {'aeropuertos': [], 'lagos': [], 'conectividad_tipos': []})
                 diccionario_provincia['aeropuertos'].append(aeropuerto)


     for dato in lagos:
         provincia = quitar_acentos(dato[1].lower())
         if provincia in lista_provincias:  
             lago = dato[0]
             diccionario_general.setdefault(provincia, {'aeropuertos': [], 'lagos': [], 'conectividad_tipos': []})
             diccionario_general[provincia]['lagos'].append(lago)

     return diccionario_general


def agregarTipoDeConectividad(dato, header):
    tipos_conectividad = set()  # Conjunto para almacenar los tipos de conectividad únicos
    for indice, valor in enumerate(dato[4:13]):
        if valor == 'SI':  # Verificar si el valor es "SI"
            tipos_conectividad.add(header[indice + 4])  # Agregar el tipo de conectividad al conjunto
    
    return tipos_conectividad


def conectividaddd(provi, conectividad, header, diccionario_general):
    '''
    En este método nos pasan la lista de las provincias que cumplen la condición, el diccionario creado previamente, la lista de conectividad y su encabezado.

    En el for, se itera sobre la lista de conectividad, y verifica si en esa localidad está la provincia sobre la lista de provincias que cumplen la condición y 
    le agrega sus respectivos valores. Si la provincia no está en el diccionario, la crea.
    '''
    for dato in conectividad:
        provincia = quitar_acentos(dato[0].lower())
        provincia_diccionario = ""
        
        if provincia in provi:  # Verificar si la provincia está en la lista provi
            provincia_diccionario = provincia
        else:
            if provincia == "caba":
                provincia_diccionario = "buenos aires"
            elif provincia == "tierra del fuego":
                provincia_diccionario = "tierra del fuego, antartida e islas del atlantico sur"

        # Actualizar el diccionario_general con la conectividad
        if provincia_diccionario in provi:
            conectividad_tipo = agregarTipoDeConectividad(dato, header)
            if provincia_diccionario not in diccionario_general:
                diccionario_general[provincia_diccionario] = {'aeropuertos': [], 'lagos': [], 'conectividad_tipos': set()}
            else:
                if not isinstance(diccionario_general[provincia_diccionario]['conectividad_tipos'], set):
                    diccionario_general[provincia_diccionario]['conectividad_tipos'] = set(diccionario_general[provincia_diccionario]['conectividad_tipos'])
            diccionario_general[provincia_diccionario]['conectividad_tipos'].update(conectividad_tipo)

    # Convertir los conjuntos de conectividad_tipos a listas para facilitar el manejo posterior
    for key in diccionario_general:
        diccionario_general[key]['conectividad_tipos'] = list(diccionario_general[key]['conectividad_tipos'])



def main():
     ''' 
     se abren los archivos de aeropuertos, provincias, lagos y conectividad y los gurado en una lista, en el caso de conectividad el encabezado lo guardamos en una variable

     luego creamos una lista en la que solo guradamos las provincias que cumplen con la condicion ingresada

     creamos un diccionario con las provincia que cumplen la condion, en donde le pasamos la lista de aeropuertos y la lsita de lagos, 
     y en otro aparte(porque al momento de ejecutar no me daba bien) le pasamos el diccionario creado, la lista de las provincias que cumplen la condicion, la lista de conectividades, -
     -, y el encabezado de la conectividad

     mostramos el resultado 
     '''
     header,conectividad=abrirConectividad()
     aeropuertos= abrirFileAirports()
     lagos= abrirarchivolagos()
     provincias=calcular_poblacion_provincias()
     poblacion = input("ingrese el numero de poblacion: ")
     opcion = input("Selecciona si es para una poblacion mayor o menor, 1:mayor, 2:menor: ")
     
     lista=[]
     if opcion == '1':
         lista=sacarprov(provincias,poblacion,">")
     elif opcion == '2':    
         lista=sacarprov(provincias,poblacion,"<")

     diccionario={}      
     diccionario=crear_diccionario_general(aeropuertos, lagos, lista)   
     conectividaddd(lista,conectividad,header,diccionario)
     for clave,valor in diccionario.items():
         print(clave,valor)
         print('-----------------------------')        