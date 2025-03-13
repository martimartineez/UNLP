import pandas as pd
from pathlib import Path
import random
import unicodedata



class Pregunta():

    def normalize_text(self, text):
        text = text.lower()  # Convertir a minúsculas
        text = unicodedata.normalize('NFKD', text).encode('ASCII', 'ignore').decode('utf-8')  # Eliminar acentos
        return text

    def __init__(self, tema):  
        self.tema = tema
        self.files = {'Lagos':'datasets\lagos_arg.csv','Aeropuertos':'datasets/ar-airports.csv','Censo 2022':'datasets\c2022_tp_c_resumen_adaptado.csv', 'Conectividad':'datasets\Conectividad_Internet.csv'}
        self.opFile =  Path('datasets\preguntasPartida.csv')
       # self.tip = {'Lagos': ['Nombre','Ubicación'], 'Aeropuertos': ['elevation_ft','name','region_name','type'], 'Censo 2022':['']}
        self.df = pd.read_csv(self.files[self.tema]).fillna(0)
        self.df = self.df.applymap(lambda x: self.normalize_text(x) if isinstance(x, str) else x)  # Convertir a minúsculas Filtra quitando las mayusculas 
        self.cincoDatos = self.df.sample(n = 5)
        self.preguntas =[]
    
    def generar(self)->list:#Implemento una funcion abstracta 
        return 
#Cada una de las subClase que parten de pregunta
class Aeropueto(Pregunta):
    def __init__(self):
        super().__init__('Aeropuertos')
        self.tip = ['elevation_ft','name','region_name','type']
        self.cincoDatos['region_name'] = self.cincoDatos['region_name'].str.replace(r'\bprovince\b', ' ', regex= True).str.strip()# Elimino El province 
        self.cincoDatos['name'] = self.cincoDatos['name'].str.replace(r'\bairport\b', '', regex= True).str.strip()#Elimina airport
        self.cincoDatos['elevation_ft'] = self.cincoDatos['elevation_ft'].fillna(0)

    def generar(self) -> list:
        for _, row in self.cincoDatos.iterrows():
            pregunta = []
            tipoDePregunta = random.choice(self.tip)
            col = self.df[tipoDePregunta].unique()#obtiene los valores unicos de la columna por si los valores se repiten
            val = pd.Series(col).sample(5, random_state=1) if len(col) >= 5 else pd.Series(col)# obtengo 3 valores unicos de la columna segun el tipo de pregunta
            op = val.tolist()
            if(tipoDePregunta == 'type'):
                pregunta.append(f'El Aeropuerto {row.iloc[3]} es del tipo:')
                pregunta.append(str(row.iloc[2]))
            elif(tipoDePregunta == 'name'):
                pregunta.append( f'Para adivinar el nombre de este Aeropuerto puedo decirte que se encuentra en la provincia de "{row.iloc[10]}", además de ser del tipo {row.iloc[2]}')
                pregunta.append(str(row.iloc[3]))  
            elif(tipoDePregunta == 'elevation_ft'):
                pregunta.append(f'El Aeropuerto {row.iloc[3]}, ¿A que altura sobre el nivel del mar se encuentra?')
                pregunta.append(str(row.iloc[6]))
            else:
                pregunta.append(f'EL Aeropuerto{row.iloc[3]}, ¿Se encuentra en la provincia de?')
                pregunta.append(str(row.iloc[10]))
            pregunta.append(op)
            self.preguntas.append(pregunta)
        return self.preguntas

class Lagos(Pregunta):
    def __init__(self):
        super().__init__('Lagos')
        self.tip =['Nombre','Ubicación']
        self.cincoDatos['Nombre'] = self.cincoDatos['Nombre'].str.replace(r'\blago\b', '', regex= True).str.strip()
        
    def generar(self) -> list:
        for _, row in self.cincoDatos.iterrows():
            pregunta =[]# si preguntas no se crea cada vez, siempre añadira la misma pregunta
            tipoDePregunta = random.choice(self.tip);#Agarra un tipo de respuesta o pregunta
            col = self.df[tipoDePregunta].unique()#obtiene los valores unicos de la columna por si los valores se repiten
            val = pd.Series(col).sample(3, random_state=1) if len(col) >= 3 else pd.Series(col)# obtengo 3 valores unicos de la columna segun el tipo de pregunta
            op = val.tolist()
            if(tipoDePregunta == 'Nombre'):
                pregunta.append(f'Este lago tiene una profundidad del tipo{row.iloc[4]}, y se encuentra en la provincia de {row.iloc[1]}')# aqui podemos poner lago de del tipo medio, alto
                pregunta.append(str(row.iloc[0])) 
            else:
                pregunta.append (f"El nombre de este lago es: {row.iloc[0]}, ¿Puedes adivinar de que provincia es?")
                pregunta.append(str(row.iloc[1])) 
            pregunta.append(op)
            self.preguntas.append(pregunta)
        return self.preguntas
    
class Censo2022(Pregunta):
    def __init__(self):
        super().__init__('Censo 2022')
        self.tip =['Jurisdicción', 'Varones Total de población', 'Porcentaje en situacion de calle general']
        self.df['Porcentaje en situacion de calle general'] = self.df['Porcentaje en situacion de calle general'].astype(float).round(3)
        self.cincoDatos['Jurisdicción'] = self.cincoDatos['Jurisdicción'].str.replace(r'\bantártida e islas del atlántico sur\b', '', regex= True).str.strip()
        self.cincoDatos['Jurisdicción'] = self.cincoDatos['Jurisdicción'].str.replace(r'[,"\']','', regex = True) 
        self.cincoDatos['Porcentaje en situacion de calle general'] = self.cincoDatos['Porcentaje en situacion de calle general'].astype(float).round(3)
       

    def generar(self) -> list:
        for _, row in self.cincoDatos.iterrows():
            pregunta = []
            tipoDePregunta = random.choice(self.tip)
            col = self.df[tipoDePregunta].unique()#obtiene los valores unicos de la columna por si los valores se repiten
            val = pd.Series(col).sample(3, random_state=1) if len(col) >= 3 else pd.Series(col)# obtengo 3 valores unicos de la columna segun el tipo de pregunta
            op = val.tolist()
            if(tipoDePregunta == 'Jurisdicción'):
                pregunta.append(f'Con un índice de pobreza general que ronda el {row.iloc[13]}%, ¿Qué jurisdicción tiene dicho valor?')# el numero tiene muchos decimales que redondeo 
                pregunta.append(str(row.iloc[0]))
            elif(tipoDePregunta == 'Varones Total de población'):
                pregunta.append( f'Si {row.iloc[9]} "mujeres" componen el total de la población de "{row.iloc[0]}", la cual es: {row.iloc[1]}, ¿Cuántos "Hombres" componen el resto?')
                pregunta.append(str(row.iloc[5]))
            else:#(tipoDePregunta == 'Porcentaje en situacion de calle general'):
                pregunta.append(f'La jurisdicción de {row.iloc[0]} tiene un porcentaje de pobreza  general del:...')
                pregunta.append(str(row.iloc[13]))
            pregunta.append(op)
            self.preguntas.append(pregunta)
        return self.preguntas


class Conectividad(Pregunta):
    def __init__(self):
        super().__init__('Conectividad')
        self.tip = ['posee_conectividad','TELEFONIAFIJA','FIBRAOPTICA']

    def generar(self)->list:
        for _, row in self.cincoDatos.iterrows():
            pregunta = []
            tipoDePregunta = random.choice(self.tip)
            col = self.df[tipoDePregunta].unique()#obtiene los valores unicos de la columna por si los valores se repiten
            val = pd.Series(col).sample(2, random_state=1) if len(col) >= 2 else pd.Series(col)# obtengo 3 valores unicos de la columna segun el tipo de pregunta
            op = val.tolist()
            if(tipoDePregunta == 'posee_conectividad'):
                pregunta.append(f'En  la provincia de {row.iloc[0]}, el partido de {row.iloc[1]}, ¿Posee algún tipo de conectividad?')
                pregunta.append(str(row.iloc[16]))
            elif(tipoDePregunta == 'TELEFONIAFIJA'):
                pregunta.append(f'Sabemos que el partido de {row.iloc[1]}, {row.iloc[16]} posee algún tipo de conectividad, pero ¿Posee telefonía fija?')
                pregunta.append(str(row.iloc[10]))
            else:#(tipoDePregunta == 'FIBRAOPTICA')
                pregunta.append(f'El partido de {row.iloc[1]}¿Posee fibra optica?')
                pregunta.append(str(row.iloc[7]))
            pregunta.append(op)
            self.preguntas.append(pregunta)
        return self.preguntas

#Deacuerdo al Tema retornara el objeto con la clase de Tema
class constructor():
    @staticmethod
    def crear(tema):
        if tema == 'Aeropuertos':
            return Aeropueto()
        if tema == 'Censo 2022':
            return Censo2022()
        if tema == 'Lagos':
            return Lagos()
        if tema == 'Conectividad':
            return Conectividad()