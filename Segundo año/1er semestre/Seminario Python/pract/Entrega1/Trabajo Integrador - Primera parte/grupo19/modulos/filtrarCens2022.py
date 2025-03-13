from pathlib import Path
import csv

file_of = Path("datasets\c2022_tp_c_resumen_adaptado.csv")

def opDatos():
    with file_of.open("r", encoding="utf-8")as file:
        cs = csv.reader(file)
        head = next(cs)
        dat = list(cs)
    return head, dat
"""La inforacion obtenida se filtra, para eliminar los  /// y -"""
def filtrar(dat):
    for fila in dat:
        for i,dato in enumerate(fila):
            if dato == "///" or dato == "-":
                fila[i] = "0"

"""Con lo obtenido, primero verifico que la columna que quiero agregar no se encuentra ya creada, sino lo creo y añado sus datos"""
def agregarColu(header,dat):
    # Primero evaluo si la columna ya existe dentro del header que retorna opDatos()
    if("Porcentaje en situacion de calle general" not in header):
        header.append("Porcentaje en situacion de calle general")
        for  ciudad in dat:
            #Calculo el calor para incertarlo al final de la fila
            num = float(ciudad[4])/float(ciudad[1]) * 100
            ciudad.append(num);
    else:
        print("Estas tratando de añadir una columna que ya existe")

"""Todos los cambios se acctualiza en los dataSets"""
def cargarCambios(hed, dat):
    with file_of.open("w", encoding="utf-8", newline='')as file:
        wrt = csv.writer(file)
        wrt.writerows([hed])
        wrt.writerows(dat)
            
def upDate():
    h, d= opDatos()
    filtrar(d)
    agregarColu(h,d)
    cargarCambios(h,d)
