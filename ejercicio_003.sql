CREATE DATABASE db;

CREATE TABLE usuarios(
   id INT NOT NULL,
   usuario VARCHAR(20) NOT NULL,
   nombre VARCHAR(20) NOT NULL,
   sexo VARCHAR(1) NOT NULL,
   nivel INT NOT NULL,
   email VARCHAR(50) NOT NULL,
   telefono VARCHAR(20) NOT NULL,
   marca VARCHAR(20) NOT NULL,
   compañia VARCHAR(20) NOT NULL,
   saldo FLOAT NOT NULL,
   activo BOOLEAN NOT NULL,
   PRIMARY KEY(id)
);

INSERT INTO usuarios(id, usuario, nombre, sexo, nivel, email, telefono, marca, compañia, saldo, activo) 
       VALUES (1, 'BRE2271', 'BRENDA','M', 2, 'brenda@live.com', '655-330-5736', 'SAMSUNG', 'IUSACELL',100,'1');

INSERT INTO usuarios(id, usuario, nombre, sexo, nivel, email, telefono, marca, compañia, saldo, activo) 
       VALUES (2,'OSC4677','OSCAR','H', 3,'oscar@gmail.com','655-143-4181','LG','TELCEL', 0,'1');

INSERT INTO usuarios(id, usuario, nombre, sexo, nivel, email, telefono, marca, compañia, saldo, activo) 
       VALUES (3, 'JOS7086','JOSE','H', 3, 'francisco@gmail.com', '655-143-3922', 'NOKIA','MOVISTAR', 150, '1');

--1 Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG

SELECT nombre, telefono FROM usuarios WHERE marca NOT IN ('LG', 'SANSUNG');

--2 Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL

SELECT usuario, telefono FROM usuarios WHERE compañia = 'IUSACELL';

--3 Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL

SELECT usuario, telefono FROM usuarios WHERE compañia <> 'TELCEL';

--4 Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA

SELECT avg(saldo) FROM usuarios WHERE marca = 'NOKIA';

--5 Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL

SELECT usuario, telefono FROM usuarios WHERE compañia IN ('IUSACELL', 'AXEL');

--6 Mostrar el email de los usuarios que no usan yahoo

SELECT email FROM usuarios WHERE email NOT LIKE '%yahoo';

--7 Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL

SELECT usuario, telefono FROM usuarios WHERE compañia NOT IN ('TELCEL','IUSACELL');

--8 Listar el login y teléfono de los usuarios con compañia telefónica UNEFON

SELECT usuario, telefono FROM usuarios WHERE compañia = 'UNEFON';

--9 Listar las diferentes marcas de celular en orden alfabético descendentemente

SELECT DISTINCT marca FROM usuarios ORDER BY marca DESC;

--10 Listar las diferentes compañias en orden alfabético aleatorio

SELECT DISTINCT compañia FROM usuarios ORDER BY RAND();

--11 Listar el login de los usuarios con nivel 0 o 2

SELECT usuario FROM usuarios WHERE nivel IN (0,2);

--12 Calcular el saldo promedio de los usuarios que tienen teléfono marca LG

SELECT avg(saldo) FROM usuarios WHERE marca = 'LG';