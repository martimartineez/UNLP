from pathlib import Path
import csv
file_airports=Path('./datasets/ar-airports.csv')

def filtrarTiposAirports():
    with open(file_airports,'r',encoding='utf-8') as file:
        '''
        Función que devuelve un str que contiene, sin repeticiones (usando un set), los elementos de la columna 2 ('type') de cada fila del lector, concatenados y separados por ', '.
        '''
        reader=csv.reader(file, delimiter=',')
        next(reader)
        tipos=', '.join(set((fila[2])for fila in reader))
    print(tipos)

def ImrimirTipoElevacion(valor):
    '''
    Función que adapta la elevación ordinal pasada como parámetro a su equivalente en 'elevation_name' y la devuelve como str.
    '''
    if valor <=131:
        elevacion='bajo'
    elif valor <=903:
        elevacion='medio'
    else:    
        elevacion='alto'
    airports=[]
    with open(file_airports,'r',encoding='utf-8') as file:
        reader=csv.DictReader(file)
        for linea in reader:
            if linea['elevation_name']==elevacion:
                airports.append(linea['name'])
    print(', '.join(airports))


def filtrarMayoroMenorElevacion(valor):
    '''
    Función que devuelve los aeropuertos con mayor o menor elevación en relación con el parámetro recibido.
    '''
    with open(file_airports,'r',encoding='utf-8') as file:
        reader=csv.reader(file, delimiter=',')
        next(reader)
        aux=input('Mostrar los aeropuetos de mayor o menor elevacion: ').lower()
        lista = [fila[3] for fila in reader if fila[6] != '' and ((aux== 'mayor' and int(fila[6]) > valor) or (aux.lower() == 'menor' and int(fila[6]) < valor))]
    print(', '.join(lista))
