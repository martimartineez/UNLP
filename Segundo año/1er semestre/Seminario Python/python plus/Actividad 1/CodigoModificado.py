def WithoutAccent(my_text,dejarMayus=True):
    vowles = {
    'Á': 'A', 'á': 'a',
    'É': 'E', 'é': 'e',
    'Í': 'I', 'í': 'i',
    'Ó': 'O', 'ó': 'o',
    'Ú': 'U', 'ú': 'u'
}
    #completar
    if(not dejarMayus):
        my_text = my_text.lower()
    result = ''.join(vowles.get(letter, letter) for letter in my_text)
    return result

#Ejemplos de uso de la función

print(WithoutAccent("Río Negro"))
#debe retornar "Rio Negro"

print(WithoutAccent("Río Negro", False))
#debe retornar "rio negro"

import csv
file_name = 'ar.csv'
try:
    with open(file_name) as arg_data:
        csv_reader = csv.reader(arg_data)
        print(type(csv_reader))
except FileNotFoundError:
    print(f'No se encontro el archivo {file_name}')

finally:
    print('me ejecuto siempre sin importar que pase')