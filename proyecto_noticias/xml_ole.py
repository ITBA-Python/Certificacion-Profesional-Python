import requests

def pedir_noticias():
    r = requests.get("https://www.ole.com.ar/rss/ultimas-noticias/")
    with open("news_feed.xml", "wb") as fp:
        fp.write(r.content)
