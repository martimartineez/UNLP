def quitar_acentos(letra_con_acento):
    ''' 
    Este método recibe una cadena de texto y devuelve la misma cadena pero sin acentos.
    '''
    acentos = {
        'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
    }
    letra_con_acento=letra_con_acento.lower()
    letras_sin_acento = []

    for letra in letra_con_acento:
        letras_sin_acento.append(acentos.get(letra, letra))
    return ''.join(letras_sin_acento)