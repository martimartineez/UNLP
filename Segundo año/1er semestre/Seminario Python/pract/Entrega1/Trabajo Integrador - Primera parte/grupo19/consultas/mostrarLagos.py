from pathlib import Path
import csv

ruta_archivo = Path('.') / 'datasets' / 'lagos_arg.csv'

def abrirarchivolagos():
     '''
       abre el archivo y solo nos quedamos con los datos de los lagos, sin el encabezado, concatenados y separados por ', '
     '''
     with open(ruta_archivo, "r", encoding='utf-8') as archivo:
         csv_leer= csv.reader(archivo,delimiter=',')
         next(csv_leer)
         datos= list(csv_leer)
     return datos

def mostrarsuperficie(lagos, criterio):
     '''
     Crea un diccionario donde las claves son los criterios de tamaño de superficie
     y los valores son listas de lagos que cumplen con ese criterio.
     '''
     lagos_por_criterio = {}

     for dato in lagos:
         if dato[6] in criterio:
            #dato[2] es la superficie
            #dato[0] nombre del lago
            #Si la clave no existe en el diccionario, setdefault() puede agregar la clave al diccionario con un valor por defecto.
            #la superficie la toma como clave, y el nombre del lago como valor
             lagos_por_criterio.setdefault(dato[2],[]).append(dato[0])

            #lo de arriba es lo mismo que hacer esto
            #superficie = dato[2]
            #if superficie not in lagos_por_criterio:
             #   lagos_por_criterio[superficie] = [dato[0]]
            #else:
             #   lagos_por_criterio[superficie].append(dato[0])

     return lagos_por_criterio

#ahora no se rompe la funcion si se agrega un valor erroneo
def MostrarLagos(tamaño):
     '''
     creamos una variable para guardar el diccionario
     abrimos los archivos de los lagos y lo guardamos en una lista
     mostramos los lagos dependiendo de los 3 criterios que haya elegido el usuario.
     '''
     lagos_por_criterio={}
     lagos = abrirarchivolagos()

     ok=True
     while ok:
         if tamaño == "1":
             lagos_por_criterio=mostrarsuperficie(lagos,"bajo")
             ok=False
         elif tamaño == "2":
             lagos_por_criterio=mostrarsuperficie(lagos,"medio")
             ok=False
         elif tamaño == "3":        
             lagos_por_criterio=mostrarsuperficie(lagos,"grande")
             ok=False
         else :
             tamaño=input('no ingreso ningun numero, vuelva a ingresar otro (1: bajo, 2: medio, 3: grande)')
     #imprimimos el resultado final        
     for clave,valor in lagos_por_criterio.items():
         print(f' superfieice: {clave} KM^2 , lagos: {valor}')
