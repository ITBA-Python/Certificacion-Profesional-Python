from xml_ole import pedir_noticias
from xml_parser import parsear_noticias
from data_analysis.analisis_noticias import analisis_titulos

# Pedimos las noticias
pedir_noticias("https://www.ole.com.ar/rss/ultimas-noticias/", 'news_feed.xml')

# Parseamos las noticias
news = parsear_noticias('news_feed.xml')

# Analizamos los datos
analisis_titulos(news, 3)