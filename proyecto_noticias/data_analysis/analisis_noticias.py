def analisis_titulos(noticias, cantidad):
    print(noticias)
    for n in noticias:
        print(n['title'])
    print(noticias[cantidad]["title"])