CREATE DATABASE produccion;

CREATE TABLE productos(
  codigo varchar(10) not null,
  nombre varchar(30) not null,
  precio int not null,
  fechaAlta date not null,
  PRIMARY KEY (codigo)
);

INSERT INTO productos(codigo, nombre, precio, fechaAlta) VALUES ('a01','Afilador', 2, '2007-11-02');
INSERT INTO productos(codigo, nombre, precio, fechaAlta) VALUES ('s01','Silla mod. ZAZ', 20, '2007-11-03');
INSERT INTO productos(codigo, nombre, precio, fechaAlta) VALUES ('s02','Silla mod. XAX', 25, '2007-11-03');

--1 Listar todos los elementos de tabla:

SELECT * FROM productos;

--2 Listar productos que se llaman "Afilador":

SELECT * FROM productos WHERE nombre = 'Afiliador';

--3 Listar productos cuyo nombre comienzan por S:

SELECT * FROM productos WHERE nombre LIKE 'S%';

--4 Listar productos que tienen un precio superior a 22, y además no deseamos ver todos los campos, sino sólo el nombre y el precio:

SELECT nombre,precio FROM productos WHERE precio > 22;

--5 Determianr precio medio de las sillas:

SELECT avg(precio) AS 'Promedio' FROM productos WHERE nombre LIKE 'Silla%';

--6 Vamos a modificar la estructura de la tabla, se desea agregar columna "categoria":

ALTER TABLE productos ADD categoria varchar(20);

--7 Todas las categorías tienen el valor NULL, y eso no es muy útil. Vamos a dar el valor "utensilio" a la categoría de todos los productos existentes:

UPDATE productos SET categoria = "utensilio";

--8 Modificaremos los productos que comienza por la palabra "Silla", para que su categoría sea "silla"

UPDATE productos SET categoria = 'silla' WHERE nombre LIKE 'Silla%';

--9 Para ver la lista categorías (sin que aparezcan datos duplicados):

SELECT DISTINCT categoria FROM productos;

--10 Ver la cantidad de productos que tenemos en cada categoría, deberemos usar "count" y agrupar los datos con "group by":

SELECT categoria, count(*) FROM productos GROUP BY categoria;