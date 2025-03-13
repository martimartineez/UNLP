from pathlib import Path
import csv
file_of = Path("datasets\c2022_tp_c_resumen_adaptado.csv")

def opDatos():
    with file_of.open("r", encoding="utf-8")as file:
        cs = csv.reader(file)
        head = next(cs)
        dat = list(cs)
    return head, dat
"""La funcion se encarga de obtener un diccionario en base a las casillas que me interesan, utilizando las zonas o jurisdicciones 
    como llaves, y el porsentaje de pobres general como valores. Luego retornara un diccionario ordenada utilizando la funcion sorted.item()"""
def opDiccDatos():
    h,d = opDatos()
    dicc = {}
    #creo la lista que me permite tener juntos los nombres de las zonas y sus porsentajes
    for fila in d:
        dicc[fila[0]] = float(fila[-1])
    ordenados = sorted(dicc.items(), key = lambda item:item[1], reverse= True)
    return ordenados

"""Se encarga de recibir el diccionario y recorrer las 5 posiciones e imprimiendolos"""
def listMayor5():
    ord = opDiccDatos()
    print("las 5 jurisdicciones con mayor indice en situacion de calle son:")
    i = 0
    for nom in ord:
        i += 1
        if(i > 5):
            break
        print(f"la jurisdiccion de: {nom[0]} tien un total de: {format(nom[1], '4f')}%")
