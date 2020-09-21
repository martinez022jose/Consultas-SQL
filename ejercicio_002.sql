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

--1 Listar los nombres de los usuarios

SELECT nombre FROM usuarios;

--2 Calcular el saldo máximo de los usuarios de sexo "Mujer"

SELECT max(saldo) FROM usuarios WHERE sexo = 'M';

--3 Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY

SELECT nombre,telefono FROM usuarios WHERE marca IN ('NOKIA', 'BLACKBERRY', 'SONY');

--4 Contar los usuarios sin saldo o inactivos

SELECT count(*) FROM usuarios WHERE salgo <= 0 AND NOT activo;

--5 Listar el login de los usuarios con nivel 1, 2 o 3

SELECT *FROM usuarios WHERE nivel IN (1,2,3);

--6 Listar los números de teléfono con saldo menor o igual a 300

SELECT telefono FROM usuarios WHERE saldo <= 300;

--7 Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL

SELECT sum(saldo) FROM usuarios WHERE compañia = 'NEXTEL';

--8 Contar el número de usuarios por compañía telefónica

SELECT compañia, count(*) FROM usuarios GROUP BY compañia;

--9 Contar el número de usuarios por nivel

SELECT nivel, count(*) FROM usuarios GROUP BY nivel;

--10 Listar el login de los usuarios con nivel 2

SELECT usuario FROM usuarios WHERE nivel = 2;

--11 Mostrar el email de los usuarios que usan gmail

SELECT email FROM usuarios WHERE email LIKE '%gmail.com';

--12 Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA

SELECT nombre, telefono FROM usuarios WHERE marca IN ('LG', 'SAMSUNG', 'MOTOROLA');