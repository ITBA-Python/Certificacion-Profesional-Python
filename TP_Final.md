# TP Final Certificación Profesional Python

## Resumen

Se pide implementar un programa que permita leer datos de una API de finanzas, guardarlos en una base de datos y graficarlos.

## Detalles de implementación

### Menú principal

El programa debe presentar un menú principal donde puedan elegirse las siguientes dos opciones:

 1. Actualización de datos
 2. Visualización de datos

### Actualización de datos

El programa debe solicitar al usuario el valor de un ticker, una fecha de inicio y una fecha de fin. Debe luego pedir los valores a la API y guardar estos datos en una base de datos SQL.

Ejemplo:
```
>>> Ingrese ticker a pedir:
AAPL
>>> Ingrese fecha de inicio:
2022/01/01
>>> Ingrese fecha de fin:
2022/07/01
>>> Pidiendo datos ...
>>> Datos guardados correctamente
```

### Visualización de datos

El programa debe permitir dos visualizaciones de datos:

 1. Resumen
 2. Gráfico de ticker

### Resumen

Debe imprimir un resumen de los datos guardados en la base de datos.

Ejemplos:
```
>>> Los tickers guardados en la base de datos son:
>>> AAPL - 2022/01/01 <-> 2022/07/01
>>> AAL  - 2021/01/01 <-> 2022/07/01
```

### Gráfico

El programa debe permitir gráficar los datos guardados para un ticker especifico.

Ejemplo:
```
>>> Ingrese el ticker a graficar:
AAL
```

## Links utiles

 1. [API de valores de finanzas] (https://polygon.io/docs/stocks/getting-started).
 2. [Libreria de base de datos] (https://docs.python.org/3/library/sqlite3.html).
 