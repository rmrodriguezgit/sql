-- Sumatoria 
-- Promedio
-- Desviaci�n Est�ndar

-- Caso fifasys
-- Ustedes trabajan para el Seleccionador Nacional de Uruguay
-- Selecci�n Sub 22 y Selecci�n de Mayores (17 selecci�n)
-- �Qu� criterios considero para seleccionar un jugador a Uruguay?
-- Criterio es el Potential

USE fifasys;

SELECT *
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22
ORDER BY P.potential DESC;

-- Posiciones de la BD fifasys
SELECT DISTINCT P.position
FROM players as P
-- CAM Medio Centro Ofensivo
-- RWB Medio por derecha
-- LM  Medio por izquierda
-- GK  Portero - GolKeaper
-- CM  Medio Centro
-- RM  Medio Derecha
-- CDM Medio de contenci�n
-- LW Extremo Izquierdo
-- LWB Medio por izquierda
-- CF Centro Delantero
-- RB Lateral Derecha
-- ST Delantero - Striker 
-- LB Lateral Izquierda
-- RW Extremo Derecho
-- CB Defensa Central

-- C�mo elegir a los mejores defensas
SELECT * FROM habilities;
-- Interceptions, agresion, long_passing, finishing, jumping, short_passing, stamina, sprint_speed
-- Necesitamos a los mejores en salto sean Uruguayos y menores de 22 - Promedio Salto es 63 desvstd 10.91 todos
-- Defensas promedio 66 y desvest 7.39
-- Consulta base
SELECT *
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22
ORDER BY P.potential DESC;
--
SELECT AVG(H.jumping),STDEV(H.jumping)
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22 AND
P.position IN ('CB','RB','LB');

SELECT NP.name_player, P.position, P.club, H.jumping
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22 AND
P.position IN ('CB','RB','LB') AND H.jumping>=66;

-- Promedio es de 64 y con una desv est�ndar de 10.49
SELECT AVG(H.sprint_speed),STDEV(H.sprint_speed)
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22 AND
P.position IN ('CB','RB','LB');

SELECT NP.name_id, NP.name_player, P.position, P.club, H.sprint_speed
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22 AND
P.position IN ('CB','RB','LB') AND H.sprint_speed>=64;

-- promedio 63 y desv est�ndar de 7.36
SELECT AVG(H.stamina),STDEV(H.stamina)
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22 AND
P.position IN ('CB','RB','LB');

SELECT P.name_id, NP.name_player, P.position, P.club, H.stamina
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE NP.nationality = 'Uruguay' AND  NP.age <=22 AND
P.position IN ('CB','RB','LB') AND H.stamina>=63;

-- Actualizaci�n solo para J�mena 
UPDATE name_players
SET name_player = 'Abderrazak Hamdallah'
WHERE name_id = 639 ;
-- 2319 Mat�as Olivera, 6396 Agust�n Rogel, 10100 Jos� Luis Rodr�guez, 8819 Cristian

select * from name_players
where name_id = 639;

-- Proyecto Final
-- Entrega
-- Tener una base de datos (Tema ustedes lo escogieron)
-- Tener tantas tablas como requiera su Base de Datos
-- CREATE DATABASE
-- CREATE TABLE
-- INSERT (desde el excel, hasta el texto que me permite importar m�nimo 100 datos)
-- Se entregar� un Estudio de Caso (Ejemplo Selecci�n Uruguay)
-- sustuir con su informaci�n
-- Ejemplo: Estad�stica de los pacientes que ingresaron en el mes de mayo por COVID edad, genero, estatus social
-- Ejemplo: Cantidad de productos vendidos del �rea de la salud en el mes de mayo
-- �Cu�ntas consultas van a entregar de sus sistema?
-- 25 x 4 = 100 Calificaci�n Final  60% - 40% Examen Final
-- Para su entrega Captura de Video con la corrida las consultas y se anexa un documento y liga del video URL.