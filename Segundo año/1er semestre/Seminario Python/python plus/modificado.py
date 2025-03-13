import pandas as pd
file_route = "lagos_arg.csv"

def print_report(title, datos):
    print(f"{title.capitalize():-^40}")
    for provincia, cant in datos.items():
        print(provincia)
        for sup, cantidad in cant.items():
            print(f"{sup:<15} {cantidad}")

df_lagos=pd.read_csv(file_route)


grouped = df_lagos.groupby(['Ubicación', 'Sup Tamaño']).size().reset_index(name='Cantidad')


my_data = {}

for indice, row in grouped.iterrows():
    ubicacion = row['Ubicación']
    supTamaño = row['Sup Tamaño']
    cantidad = row['Cantidad']
    
    if ubicacion not in my_data:
        my_data[ubicacion] = {}

    my_data[ubicacion][supTamaño] = cantidad

#print_report('Ubicación', my_data)

#c
#print(grouped)
#print(type(grouped))
#print(grouped.Cantidad)
#print(type(grouped.Cantidad))

#d
#print(grouped['Sup Tamaño'].unique())
#print(grouped['Ubicación'].unique())












