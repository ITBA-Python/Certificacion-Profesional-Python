--SELECT

-- Obtener toda la tabla de tracks
SELECT * FROM tracks;

--Obtener una lista con los campos TrackId, name, composer y UnitPrice
SELECT 
	trackid,
	name,
	composer,
	unitPrice
FROM
	tracks;

--ORDER BY

--Ordenar segun AlbumId en orden ascendente
SELECT
	name,
	milliseconds, 
	albumid
FROM
	tracks
ORDER BY
	albumid ASC;

--Ordenar por AlbumId y luego por Milliseconds
SELECT
	name,
	milliseconds, 
	albumid
FROM
	tracks
ORDER BY
	albumid ASC,
    milliseconds DESC;
	
--WHERE

--Obtener los tracks que tengan AlbumId=1
SELECT
   name,
   milliseconds,
   bytes,
   albumid
FROM
   tracks
WHERE
   albumid = 1;

--Obtener los tracks que AlbumId sea 1 y duren mas de 250000 milisegundos
SELECT
	name,
	milliseconds,
	bytes,
	albumid
FROM
	tracks
WHERE
	albumid = 1
AND milliseconds > 250000;

--Obtener los tracks que sean compuestos por un tal Smith
SELECT
	name,
	albumid,
	composer
FROM
	tracks
WHERE
	composer LIKE '%Smith%'
ORDER BY
	albumid;

--Obtener los tracks que su id sea 2 o 3
SELECT
	name,
	albumid,
	mediatypeid
FROM
	tracks
WHERE
	mediatypeid IN (2, 3);

--LIMIT

--Obtenemos los 10 tracks más grandes
SELECT
	trackid,
	name,
	bytes
FROM
	tracks
ORDER BY
	bytes DESC
LIMIT 10;

--BETWEEN

--Buscar las facturas que esten entre 14.96 y 18.86
SELECT
    InvoiceId,
    BillingAddress,
    Total
FROM
    invoices
WHERE
    Total BETWEEN 14.91 and 18.86    
ORDER BY
    Total;
	
--JOINS

-- Obtener los nombres de todos los álbumes junto con el nombre del artista
SELECT 
    Title,
    Name
FROM 
    albums
INNER JOIN artists 
    ON artists.ArtistId = albums.ArtistId;

--Obtener los tracks, con el album y el artista
SELECT
    trackid,
    tracks.name AS track,
    albums.title AS album,
    artists.name AS artist
FROM
    tracks
    INNER JOIN albums ON albums.albumid = tracks.albumid
    INNER JOIN artists ON artists.artistid = albums.artistid;

--GROUP BY

--Seleccionar la cantidad de tracks por cada album, de mayor a menor
SELECT
	albumid,
	COUNT(trackid)
FROM
	tracks
GROUP BY
	albumid
ORDER BY COUNT(trackid) DESC;

--Obtener el tamaño total de cada album y la duracion
SELECT
	albumid,
	SUM(milliseconds) length,
	SUM(bytes) size
FROM
	tracks
GROUP BY
	albumid;

--UNION

--Combinar los empleados y clientes en una sola lista, ordenando por nombre y apellido
SELECT FirstName, LastName, 'Employee' AS Type
FROM employees
UNION
SELECT FirstName, LastName, 'Customer'
FROM customers
ORDER BY FirstName, LastName;

--INSERT

--Insertar un nuevo artista en la tabla
INSERT INTO artists (name)
VALUES('Bud Powell');

--Verificar la insercion
SELECT
	ArtistId,
	Name
FROM
	Artists
ORDER BY
	ArtistId DESC
LIMIT 1;

--UPDATE

--Actualizar el apellido del empleado 3 a Smith
UPDATE employees
SET lastname = 'Smith'
WHERE employeeid = 3;

--Verificar
SELECT
	employeeid,
	firstname,
	lastname,
	title,
	email
FROM
	employees
WHERE
	employeeid = 3;
	
--DELETE

--Eliminar un artista
DELETE FROM artists
WHERE artistid = 279;

--verificamos
SELECT
	ArtistId,
	Name
FROM
	artists
ORDER BY
	ArtistId DESC
LIMIT 3;

--CREATE TABLE

--Crear la tabla de contactos con nombre, apellido, email y telefono
--Cada contacto puede pertencer a uno o muchos grupos, y cada grupo puede tener 0 o muchos contactos
--contacts, groups, contact_groups

CREATE TABLE contacts (
	contact_id INTEGER PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL,
	phone TEXT NOT NULL
);

CREATE TABLE groups (
   group_id INTEGER PRIMARY KEY,
   name TEXT NOT NULL
);

CREATE TABLE contact_groups(
   contact_id INTEGER,
   group_id INTEGER,
   PRIMARY KEY (contact_id, group_id),
   FOREIGN KEY (contact_id) 
      REFERENCES contacts (contact_id) 
         ON DELETE CASCADE,
   FOREIGN KEY (group_id) 
      REFERENCES groups (group_id) 
         ON DELETE CASCADE
);

--ALTER TABLE
--Crear la tabla devices con 3 columnas: name, model y serial

CREATE TABLE devices (
   name TEXT NOT NULL,
   model TEXT NOT NULL,
   serial INTEGER NOT NULL UNIQUE
);

--Cambiar el nombre de devices a equipment
ALTER TABLE devices
RENAME TO equipment;

--Agregar columna location
ALTER TABLE equipment 
ADD COLUMN location text;

--Renombrar la columna serial a serialNumber
ALTER TABLE equipment
RENAME COLUMN serial TO serialNumber;
	
--DROP 
DROP TABLE equipment;