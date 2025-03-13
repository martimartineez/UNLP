def WithoutAccent(my_text):
    vowles = {
    'Á': 'A', 'á': 'a',
    'É': 'E', 'é': 'e',
    'Í': 'I', 'í': 'i',
    'Ó': 'O', 'ó': 'o',
    'Ú': 'U', 'ú': 'u'
}
    #completar
    my_text = my_text.lower()
    result = ''.join(vowles.get(letter, letter) for letter in my_text)
    return result

#Ejemplos de uso de la función

print(WithoutAccent("Río Negro"))
#debe retornar "Rio Negro"

#WithoutAccent("Río Negro", False)
#debe retornar "rio negro"

import csv
file_name = 'ar.csv'
try:
    with open(file_name) as arg_data:
        csv_reader = csv.reader(arg_data)
except:
    print(f'Hubo problemas con {file_name}')