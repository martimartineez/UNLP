from pathlib import Path
import csv
#hacemos la ruta del archivo
#ruta_archivo = Path(r"C:\Users\suare\OneDrive\Escritorio\python pruebas\tpgrupal\datasets")/"lagos_arg.csv"
ruta_archivo = Path('.') / 'datasets' / 'lagos_arg.csv'
#abrimos el archivo para solo lectura 
"""abrimos el archivo para solo lectura"""
def abrirarchivo():
     with open(ruta_archivo, "r", encoding='utf-8') as archivo:
         #csv.reader se utiliza para leer la fila de los archivos, y el delimitador es la coma
         csv_leer= csv.reader(archivo,delimiter=',')
         #usamos with para asignar y liberar recursos cuando se desee
         header=next(csv_leer)#lo que hace es saltearse la primer linea del archivo 
         #recorremos el archivo pero con csv_leer
         datos= list(csv_leer)
     return header,datos

#modificamos el archivo, agregamos la columna que pide el enunciado
'''de la informacion que obtuvimos, creamos una columna nueva en la que se puede tener 3 criterio que son determinados por la superficie de cad lago'''
def agregarTamaño(header,datos):
     if 'Sup Tamaño' not in header:
         header.append("Sup Tamaño")
         for lago in datos:
             tamaño = int(lago[2])#convierte la superficie que esta en string a numero

             if tamaño <= 17:#chco
                 lago.append("bajo")
             elif tamaño >17 and tamaño <= 59:#medio
                 lago.append("medio")
             elif tamaño>59:#grande
                 lago.append("grande") 

'''aca nos pasan las coordenadas y realizamos las cuentas y obtenemos los datos necesarios para convertilo a latitud o longitud'''
def DegmsAgd(coordenada):
    # Dividir la cadena en grados, minutos, segundos y dirección
    partes = coordenada.split('°')
    grados = int(partes[0])
    partes = partes[1].split("'")
    minutos = int(partes[0])
    partes = partes[1].split('"')
    segundos = int(partes[0])
    direccion = partes[1]

    # Convertir a grados decimales
    gd = grados + minutos / 60.0 + segundos / 3600.0

    # Si la dirección es Sur (S) o Oeste (W), cambiar el signo
    if direccion == 'S' or direccion == 'O':
        gd *= -1

    return gd

''' con la informacion que tenemos generamos dos columnas nuevas que su valor va a depender de las coordenadas'''
def agregarLatitudyLongitud(header,datos):
     if 'Latitud' not in header and 'Longitud' not in header:
         header.append("Latitud")
         header.append("Longitud")
         for line in datos:  
             valor=line[5]
             dato=valor.split()
         
             latitud=dato[0]
             longitud=dato[1]

             numla=DegmsAgd(latitud)
             numlo=DegmsAgd(longitud)
             
             #convertimos los numeros enteros a strings
             nla= str(numla)
             nlo= str(numlo)

             line.append(nla)
             line.append(nlo)

"""Todos los cambios que hicimos hasta ahora se acctualizaran en el dataset"""
def cargarDatosDelArchivo(header,datos):
     with open(ruta_archivo, "w", encoding='utf-8',newline='') as archivo1:
         escribir= csv.writer(archivo1)
         escribir.writerows([header])#para modificar el archivo
         escribir.writerows(datos)
     
def todo():
     header,datos=abrirarchivo()
     agregarTamaño(header,datos)
     agregarLatitudyLongitud(header,datos)
     cargarDatosDelArchivo(header,datos)



