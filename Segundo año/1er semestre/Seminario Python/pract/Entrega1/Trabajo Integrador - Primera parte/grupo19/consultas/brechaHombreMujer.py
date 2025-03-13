from pathlib import Path
import csv

file_of = Path("datasets\c2022_tp_c_resumen_adaptado.csv")

def opDatos():
    with file_of.open("r", encoding="utf-8")as file:
        cs = csv.reader(file)
        head = next(cs)
        dat = list(cs)
    return head, dat
""""Primero calcula el nombre y la brecha maxima, calculando la cantidad de hombres - cantidad de mujeres, obteniendo elvalor absoluto, para poder comparar despues"""
def brechaMax():
    h,d = opDatos()
    brechaMax= -1
    nomMaxBre= ""
    for dat in d:
        if(dat[0]!= "Total del país"):
            result = abs(int(dat[5]) - int(dat[9]))
            if(result > brechaMax):
                brechaMax = result
                nomMaxBre = dat[0]
    print(f"{nomMaxBre} con un total de: {brechaMax} en la diferencia de poblacion")
    