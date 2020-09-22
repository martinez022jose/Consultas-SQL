CREATE TABLE ciudad(
    codCiudad INT NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE comuna(
    codComuna INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    codCiudad INT NOT NULL,

);

CREATE TABLE cliente(
    codCliente INT NOT NULL,
    rut INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    deuda NOT NULL,
    estadocivil VARCHAR(1) NOT NULL,
    sexo VARCHAR(1),
    codComuna INT NOT NULL
);

INSERT INTO ciudad(codCiudad, nombre) 
    VALUES(1,'Santiago');

INSERT INTOcomuna(codComuna, nombre, codCiudad) 
    VALUES(1,'La Granja',1);
INSERT INTO comuna(codComuna, nombre, codCiudad) 
    VALUES(6,'Independencia',1);
INSERT INTO comuna(codComuna, nombre, codCiudad) 
    VALUES(5,'San Bernardo',1);	
INSERT INTO comuna(codComuna, nombre, codCiudad) 
    VALUES(4,'Maipu',1);	
INSERT INTO comuna(codComuna, nombre, codCiudad) 
    VALUES(3,'San Ramon',1);	
INSERT INTO comuna(codComuna, nombre, codCiudad) 
    VALUES(2,'La Florida',1);

INSERT INTO cliente(codCliente, rut, nombre, fecha, deuda, estadocivil, sexo, codComuna) 
    VALUES(5, 555,'German','11/09/1970',999,'c','f', 2);	
INSERT INTO cliente(codCliente, rut, nombre, fecha, deuda, estadocivil, sexo, codComuna) 
    VALUES(4, 444,'Matias','08/15/1940',1050100,'s','m', 2);	
INSERT INTO(codCliente, rut, nombre, fecha, deuda, estadocivil, sexo, codComuna) cliente 
    VALUES(3, 333,'Josue','12/05/1950',999999,'c','m', 6);	
INSERT INTO cliente(codCliente, rut, nombre, fecha, deuda, estadocivil, sexo, codComuna) 
    VALUES(2, 222,'JotaGay','01/30/1990',20000,'s','f', 3);	
INSERT INTO cliente(codCliente, rut, nombre, fecha, deuda, estadocivil, sexo, codComuna)    
    VALUES(1, 111,'Fabian','09/28/1989',10000,'s','m', 1);

--1 Agregar primary key a tabla ciudad

ALTER TABLE ciudad
    ADD PRIMARY KEY(codCiudad);

--2 Agregar la restricción primary key al campo codComuna de la tabla comuna.

ALTER TABLE comuna
    ADD PRIMARY KEY(codComuna);

--3 Agregar la restricción forein key al campo codCiudad de la tabla comuna.

ALTER TABLE comuna 
    ADD FOREIGN KEY(codCiudad) REFERENCES ciudad(codCiudad);

--4 Agregar la restricción primary key al campo codCliente de la tabla cliente.

ALTER TABLE cliente
    ADD PRIMARY KEY(codCliente);

--5  Agregar la restricción forein key al campo cod_com de la tabla cliente.

ALTER TABLE cliente
    ADD FOREIGN KEY(codComuna) REFERENCES comuna(codComuna);

--6 Agregar el campo dirección a la tabla de los clientes

ALTER TABLE cliente
    ADD direccion varchar(100);

--7 Mostrar los clientes que son de la ciudad de Rancagua.

SELECT *  FROM cliente cli 
    INNER JOIN comuna com ON cli.codComuna = com.codComuna 
    INNER JOIN ciudad ci ON com.codCiudad = ci.codCiudad 
    WHERE ci.nombre = 'Rancagua';

--8 Mostrar cual es el promedio de deudas que tienen los clientes de la ciudad de Santiago

SELECT avg(cli.deuda) FROM cliente cli
    INNER JOIN comuna com ON cli.codComuna = com.codComuna 
    INNER JOIN ciudad ci ON com.codCiudad = ci.codCiudad
    WHERE ci.nombre = 'SANTIAGO'; 

--9 Mostrar cual es el promedio de deudas por cada comuna

SELECT com.nombre, avg(cli.deuda) FROM cliente 
    INNER JOIN comuna com ON cli.codComuna = com.codComuna;
    GROUP BY com.nombre;

--10 Mostrar cuantas personas mantienen deudas de más de 500.000 pesos

SELECT count(nombre) FROM cliente
    WHERE deuda > 500000;

--11  Mostrar cuantas mujeres deben más de 300.000 pesos

SELECT count(sexo) FROM cliente
    WHERE sexo = 'F' AND deuda > 300000;

--12 Mostrar cuantos clientes están casados por ciudad

SELECT ci.nombre, count(cli.nombre) FROM cliente
    INNER JOIN comuna com ON cli.codComuna = com.codComuna 
    INNER JOIN ciudad ci ON com.codCiudad = ci.codCiudad
    where cli.estadocivil = 'c'
    GROUP BY ci.nombre;

--13 Mostrar cuantos hombres solteros existen sin deuda

SELECT count(nombre) FROM cliente 
    WHERE estadocivil = 's' AND deuda <= 0;

--14 Mostrar cuantos clientes son mujeres por ciudad

SELECT ci.nombre, count(cli.codCliente) FROM cliente cli
    INNER JOIN comuna com ON cli.codComuna = com.codComuna 
    INNER JOIN ciudad ci ON com.codCiudad = ci.codCiudad
    WHERE cli.sexo = 'F'
    GROUP BY ci.nombre;

--15 Mostrar cual es la suma de lo adeudado por los hombres

SELECT sum(deuda) FROM cliente 
    WHERE sexo = 'M';

--16 Mostrar cual es el promedio adeudado por mujer

SELECT avg(deuda) FROM cliente
    WHERE sexo = 'F';