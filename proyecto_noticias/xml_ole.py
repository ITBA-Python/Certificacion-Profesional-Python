import requests

def pedir_noticias(url, name):
    r = requests.get(url)
    with open(name, "wb") as fp:
        fp.write(r.content)
