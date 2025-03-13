import csv

file_route = "lagos_arg.csv"

def print_report(title, datos):
    print(f"{title.capitalize():-^40}")
    for provincia, cant in datos.items():
        print(provincia)
        for sup, cantidad in cant.items():
            print(f"{sup:<15} {cantidad}")
            

with open(file_route, "r") as data_set:
    reader = csv.reader(data_set)
    header, data = next(reader), list(reader)

my_data = {}

for row in data:
    if row[1] in my_data:
        if row[6] in my_data[row[1]]:
            my_data[row[1]][row[6]] += 1
        else:
            my_data[row[1]][row[6]] = 1
    else:
        my_data[row[1]] ={row[6] : 1}


print_report('Ubicación', my_data)

print(type(my_data))