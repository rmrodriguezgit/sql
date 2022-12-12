CREATE DATABASE udelasalle;
USE udelasalle;

CREATE TABLE alumnos (
id int,
matricula int,
nombre varchar(100),
genero int,
peso float,
estatura float
);




INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (1,72581,'Giani Fausto',1,65.7,178);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (2,72429,'Alfaro Vargas Moises David',1,65,165);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (3,72731,'Alvarado Díaz Sandra Mariana',2,51,156);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (4,45580,'Arenas Alcantara Maria Jimena',2,63,167);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (5,72727,'Ayala Pérez Carlos Alberto',1,92,170);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (6,73171,'Barrios Sánchez Vania Jimena',2,55.4,169);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (7,74240,'Bautista Lopez Valeria Fernanda',2,56,157);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (8,73053,'Belman Durán David',1,65,169);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (9,35042,'Bobadilla Valenzuela Karlos Adrián',1,65,175);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (10,73870,'Campos Pérez Valeria',2,52,157);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (11,73705,'Casarrubia Arevalo Christopher Orev',1,95,193);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (12,72483,'Chagoya Veloz Diego',1,55,180);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (13,73577,'Cruz Leon Ludwing',1,77,180);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (14,73152,'Flores Guerra Patricio',1,74.5,176);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (15,72712,'Flores Juárez Mariana',2,49.4,160);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (16,72370,'García Heredia Paola',2,52,167);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (17,74296,'Garcia Hernandez José Santiago',1,73,174);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (18,72414,'Gomez Rangel Angel Yair',1,76,171);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (19,73946,'Hernandez Gutierrez Jose David',1,75,173);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (20,72474,'Landín Jantes América Fernanda',2,53,156);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (21,72701,'Martínez López Kassandra Fabiola',2,60,172);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (22,73307,'Mojica Loza Ángela',2,52,164);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (23,72999,'Navarro Guzman Andrea del Carmen',2,63,162);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (24,73113,'Oliva Morales Ricardo',1,77,183);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (25,72476,'Ramírez Juárez Litsa Daniela',2,85,169);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (26,69111,'Rea Mendoza Carlos Tristan',1,74,170);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (27,71314,'Romero Plascencia Regina',2,47,162);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (28,74168,'Salinas Ramírez Christian Emmanuel',1,68.4,160);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (29,72791,'Suárez Valencia Carlos Yair',1,67.5,178.5);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (30,70626,'Velázquez Velázquez Karla Guadalupe',2,56,150);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (31,72378,'Vera Becerra Jorge Adrián',1,52,168);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (32,74247,'Villanueva Mares Josue Jared',1,65,175);
INSERT INTO alumnos (id, matricula,nombre,genero,peso,estatura) VALUES (33,73877,'Villanueva Ortega Regina',2,50,164);


SELECT * 
FROM alumnos;

SELECT genero, count(genero) as [# Género]
FROM alumnos
GROUP BY genero

CREATE TABLE genero (
  id int,
  descripcion varchar(30)
);

SELECT *
FROM genero

INSERT INTO genero (id, descripcion) VALUES (1,'Masculino')
INSERT INTO genero (id, descripcion) VALUES (2,'Femenino')

SELECT genero, count(genero) as [# Género]
FROM alumnos
GROUP BY genero;

SELECT g.descripcion, count(a.genero) as [Cantidad]
FROM alumnos as a
JOIN genero as g
ON a.genero = g.id
GROUP BY a.genero, g.descripcion;

-- Corregir la base de datos
SELECT *
FROM Alumnos
WHERE id=15

UPDATE alumnos 
SET nombre = 'Mariana Flores Juárez',
	peso = 49,
	estatura = 160
WHERE id = 15;

-- Utilizar el comando UPDATE para corregir errores en 
-- la información origen.
-- Obtener promedio de estaturas
-- Obtener la sumatoria de pesos
-- Obtener el más alto
-- Obtener el más bajo
-- Obtener promedio de estaturas por género
-- Obtener la sumatoria de pesos por género
-- Obtener el más alto por género
-- Obtener el más bajo por género

SELECT DISTINCT a.genero, g.descripcion
FROM Alumnos AS a
JOIN genero AS g
on a.genero = g.id