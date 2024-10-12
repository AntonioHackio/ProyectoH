
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

select "Name" as nombre_pistas , "Title" as Titulos_albumes
from "Track" as c
inner join "Album" as e
on c. "TrackId" = e."AlbumId";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.

select "Name" as nombre_artistas , "Title" as Titulos_albumes
from "Artist" as c
inner join "Album" as e
on c. "ArtistId" = e."AlbumId"
order by nombre_artistas;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 

select concat (c."FirstName" , '' , c. "LastName") as nombre_cliente , "Total" as Total_facturas
from "Customer" as c
inner join "Invoice" as e
on c. "CustomerId" = e."InvoiceId"
order by total_facturas desc
limit 5;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.

select concat (c. "FirstName" , '' , c. "LastName") as nombre_empleados , concat (e. "FirstName" , '' , e. "LastName") as nombre_clientes 
from "Employee" as c
inner join "Customer" as e
on c. "EmployeeId" = e. "SupportRepId";


-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

select "InvoiceId" as facturas_id , "Name" as nombre_pistas
from "InvoiceLine" as c
inner join "Track" as e
on c."InvoiceLineId" = e."TrackId";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

select (c."Composer") as nombre_artistas , (e."Name") as generos_pistas 
from "Track" as c
inner join "Genre" as e
on c."GenreId" = e. "GenreId";


--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

select "Name" , "MediaTypeId"
from "Track";


-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

select (c."Name") as pistas , (e."Name") as generos
from "Track" as c
inner join "Genre" as e
on c."TrackId" = e."GenreId";


-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

select "FirstName" as nombre_clientes , count("InvoiceId") as Facturas_total
from "Customer" as c
right join "Invoice" as e
on c."CustomerId" = e."InvoiceId"
group by "FirstName";


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

select ("Title") as albumes , ("Name") as artistas
from "Album" as c
inner join "Artist" as e
on c."AlbumId" = e."ArtistId";


-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

select count (c."Name") as numero_pistas, (e."Name") as numero_genero
from "Track" as c
inner join "Genre" as e
on c. "TrackId" = e. "GenreId"
group by e."GenreId";


--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

select (a."Title") as Titulo_album , (t."Milliseconds") as duracion_total
from "Album" a 
left join "Track" t
on a."AlbumId" = t."TrackId" 
group by (t."TrackId"),(a."Title");


-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

select "FirstName" , sum ("Total")
from "Customer" as c
right join "Invoice" as e
on c."CustomerId" = e."InvoiceId"
group by "FirstName";


-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
 

SELECT CONCAT(e."FirstName", ' ' ,e."LastName") AS nombre_empleado, 
       (c."FirstName") AS nombre_clientes
FROM "Employee" e
LEFT JOIN  "Customer" c 
ON c."SupportRepId" = e."EmployeeId"
GROUP BY CONCAT(e."FirstName", ' ' ,e."LastName") , (c."FirstName");




