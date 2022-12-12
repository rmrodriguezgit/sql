USE INEGI

SELECT * FROM [estados]

SELECT TOP(1000)* from [municipios];

SELECT TOP(1000)* from [localidades];

-- Cuáles son los municipios del estado de Aguascalientes
SELECT *
FROM [municipios] AS M
WHERE estado_id = 1;

-- Cuántos municipios tiene el estado de Ags
SELECT Count(*)
FROM [municipios] AS M
WHERE estado_id = 1;

--Cuáles son los municipios del estado de Jalisco
SELECT *
FROM [municipios] AS M
WHERE estado_id = 14;

-- Cuáles son los municipios del estado de Guanajuato

-- Cuántos municipios tiene Oaxaca
SELECT count(*)
FROM [municipios] AS M
WHERE M.estado_id = 20;

-- Cuál es el total de población
-- Cuál es la totalidad de población masculino
-- Cuál es la totalidad de población femenino en Jalisco
-- Cuál es la cantidad de viviendas en Guerrero
-- Cuál es el municipio con mayor cantidad de población en Nuevo León
-- Cuál es el municipio con menor cantidad de población en Sonora


-- Ubique la localidad Loza de los Padres
SELECT *
FROM [localidades] AS L
WHERE L.nombre LIKE '%Loza de%';

-- Cuál es su población de Loza de los Padres
SELECT L.nombre, L.poblacion
FROM [localidades] AS L
WHERE L.nombre LIKE '%Loza de los Padres%';

-- Cuál es el id del municipio de León
SELECT *
FROM [municipios] as M
WHERE M.nombre LIKE '%León%'
-- 348

-- Cuál es la población del municipio de León 
SELECT sum(L.poblacion)
FROM [localidades] as L
WHERE L.municipio_id = 348
-- 1345300

-- Cuál es la altitud del poblado más alto y más bajo (2 querys)
SELECT TOP(1) *
FROM [localidades] as L
WHERE L.municipio_id = 348 
ORDER BY L.altitud ASC
--
SELECT TOP(1) *
FROM [localidades] as L
WHERE L.municipio_id = 348 
ORDER BY L.altitud DESC

-- Cuántas viviendas tiene la localidad de Puerto del Aire
SELECT TOP(1) L.nombre, L.viviendas
FROM [localidades] as L
WHERE L.municipio_id = 348 
ORDER BY L.altitud DESC

-- Cuántas viviendas tiene el municipo de León
SELECT sum(L.viviendas)
FROM [localidades] as L
WHERE L.municipio_id = 348 

-- Ubique en un Google maps el poblado Puerto del Aire del Municipio de León




-- JOIN
-- Cuáles son los municipios del estado de aguascalientes
SELECT * 
FROM [estados] as E
JOIN [municipios] as M
ON E.id = M.estado_id
WHERE E.id = 11 and M.clave='020' ;

-- Listar todas localidades del municipio de León, estado Guanajuato.
-- León estado.clave 12, municipio.clave 020
SELECT *
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')


-- Cual es el total de la población de las localidades de León
SELECT sum(L.poblacion) 
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')

-- Cuál es el total de la problación femenina de las localidades de León
SELECT sum(L.femenino) 
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')

--Cuál es la localidad que se encuentra en el punto más alto de León
SELECT TOP(1) *
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')
ORDER BY L.altitud DESC



