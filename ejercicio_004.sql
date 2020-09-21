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

--1 Listar el login de los usuarios con nivel 1 o 3

SELECT usuario FROM usuarios WHERE nivel IN (1,3);

--2 Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY 

SELECT nombre, telefono FROM usuarios WHERE marca <> 'BLACKBERRY';

--3 Listar el login de los usuarios con nivel 3

SELECT usuario FROM usuarios WHERE nivel = 3;

--4 Listar el login de los usuarios con nivel 0

SELECT usuario FROM usuarios WHERE nivel = 0;

--5 Listar el login de los usuarios con nivel 1

SELECT usuario FROM usuarios WHERE nivel = 1;

--6 Contar el número de usuarios por sexo

SELECT sexo, count(*) FROM usuarios GROUP BY sexo;

--7 Listar el login y teléfono de los usuarios con compañia telefónica AT&T

SELECT usuario, telefono FROM usuarios WHERE comapñia = 'AT&T';

--8 Listar las diferentes compañias en orden alfabético descendentemente

SELECT DISTINCT compañia FROM usuarios ORDER BY compañia DESC;

--9 Listar el login de los usuarios inactivos

SELECT usuario FROM usuarios WHERE NOT activo;

--10 Listar los números de teléfono sin saldo

SELECT telefono FROM usuarios WHERE saldo <= 0;

--11 Calcular el saldo mínimo de los usuarios de sexo "Hombre"

SELECT min(saldo) FROM usuarios WHERE sexo = 'H';

--12 Listar los números de teléfono con saldo mayor a 300

SELECT telefono FROM usuarios WHERE saldo > 300;

--13 Contar el número de usuarios por marca de teléfono

SELECT marca, count(*) FROM usuarios GROUP BY marca;

--14 Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG

SELECT usuario, telefono FROM usuarios WHERE marca <> 'LG';

--15 Listar las diferentes compañias en orden alfabético ascendentemente

SELECT DISTINCT compañia FROM usuarios ORDER BY compañia ASC;

--16 Calcular la suma de los saldos de los usuarios de la compañia telefónica UNEFON

SELECT sum(saldo) FROM usuarios WHERE compañia = 'UNEFON';

--17 Mostrar el email de los usuarios que usan hotmail

SELECT email FROM usuarios WHERE email LIKE '%hotmail';

--18 Listar los nombres de los usuarios sin saldo o inactivos

SELECT nombre FROM usuarios WHERE saldo <= 0 OR NOT activo;

--19 Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o TELCEL

SELECT usuario, telefono FROM usuarios WHERE compañia IN ('IUSACELL', 'TELCEL');

--20 Listar las diferentes marcas de celular en orden alfabético ascendentemente

SELECT DISTINCT marca FROM usuarios ORDER BY marca ASC;