import xml.etree.ElementTree as ET

def parsear_noticias(archivo):
    # Parseamos el XML - obtenemos el ElementTree
    tree = ET.parse(archivo)

    # Obtenemos un Element de la base del XML
    root = tree.getroot()

    news = []

    for item in root.findall("./channel/item"):
        article = {}

        for child in item:
            article[child.tag] = child.text
        
        news.append(article)

    return news