CREATE DATABASE libro

CREATE TABLE libros(
  codigo INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(30) NOT NULL,
  editorial VARCHAR(15) NOT NULL,
  precio INT NOT NULL,
  PRIMARY KEY(codigo)
 );

INSERT INTO libros (titulo,autor,editorial,precio)
  VALUES('El aleph','Borges','Planeta',15);
INSERT INTO libros (titulo,autor,editorial,precio)
  VALUES('Martin Fierro','Jose Hernandez','Emece',22);
INSERT INTO libros (titulo,autor,editorial,precio)
  VALUES('Antologia poetica','Borges','Planeta',40);

--1 Averiguar la cantidad de libros agrupados por editorial

SELECT editorial, count(*) FROM libros 
    GROUP BY editorial;

--2 Queremos conocer la cantidad de libros agrupados por editorial pero considerando sólo los que devuelvan un valor mayor a 2

SELECT editorial, count(*) FROM libros 
    GROUP BY editorial 
    HAVING count(*) > 2; 

--3 Necesitamos el promedio de los precios de los libros agrupados por editorial

SELECT editorial, avg(precio) FROM libros 
    GROUP BY editorial;

--4 sólo queremos aquellos cuyo promedio supere los 25 pesos

SELECT editorialm, avg(precio) FROM libros
    GROUP BY editorial
    HAVING avg(precio) > 25;

--5 Queremos contar los registros agrupados por editorial sin tener en cuenta a la editorial "Planeta"

SELECT editorial, count(*) FROM libros
    WHERE editorial <> "Planeta"
    GROUP BY editorial;

--6 Queremos la cantidad de libros, sin tener en cuenta los que tienen precio nulo, agrupados por editorial, rechazando los de editorial "Planeta"

SELECT editorial, count(*) FROM libros 
    WHERE precio IS NOT NULL
    GROUP BY editorial
    HAVING editorial <> 'Planeta';

--7 promedio de los precios agrupados por editorial, de aquellas editoriales que tienen más de 2 libros 

SELECT editorial, avg(precio) FROM libros
    GROUP BY editorial
    HAVING count(*) > 2;

--8 mayor valor de los libros agrupados por editorial y luego seleccionar las filas que tengan un valor mayor o igual a 30 

SELECT editorial, max(precio) FROM libros
    GROUP BY editorial
    HAVING max(precio) >= 30;


