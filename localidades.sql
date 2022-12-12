USE INEGI

SELECT * FROM [estados]

SELECT TOP(1000)* from [municipios];

SELECT TOP(1000)* from [localidades];

-- Cu�les son los municipios del estado de Aguascalientes
SELECT *
FROM [municipios] AS M
WHERE estado_id = 1;

-- Cu�ntos municipios tiene el estado de Ags
SELECT Count(*)
FROM [municipios] AS M
WHERE estado_id = 1;

--Cu�les son los municipios del estado de Jalisco
SELECT *
FROM [municipios] AS M
WHERE estado_id = 14;

-- Cu�les son los municipios del estado de Guanajuato

-- Cu�ntos municipios tiene Oaxaca
SELECT count(*)
FROM [municipios] AS M
WHERE M.estado_id = 20;

-- Cu�l es el total de poblaci�n
-- Cu�l es la totalidad de poblaci�n masculino
-- Cu�l es la totalidad de poblaci�n femenino en Jalisco
-- Cu�l es la cantidad de viviendas en Guerrero
-- Cu�l es el municipio con mayor cantidad de poblaci�n en Nuevo Le�n
-- Cu�l es el municipio con menor cantidad de poblaci�n en Sonora


-- Ubique la localidad Loza de los Padres
SELECT *
FROM [localidades] AS L
WHERE L.nombre LIKE '%Loza de%';

-- Cu�l es su poblaci�n de Loza de los Padres
SELECT L.nombre, L.poblacion
FROM [localidades] AS L
WHERE L.nombre LIKE '%Loza de los Padres%';

-- Cu�l es el id del municipio de Le�n
SELECT *
FROM [municipios] as M
WHERE M.nombre LIKE '%Le�n%'
-- 348

-- Cu�l es la poblaci�n del municipio de Le�n 
SELECT sum(L.poblacion)
FROM [localidades] as L
WHERE L.municipio_id = 348
-- 1345300

-- Cu�l es la altitud del poblado m�s alto y m�s bajo (2 querys)
SELECT TOP(1) *
FROM [localidades] as L
WHERE L.municipio_id = 348 
ORDER BY L.altitud ASC
--
SELECT TOP(1) *
FROM [localidades] as L
WHERE L.municipio_id = 348 
ORDER BY L.altitud DESC

-- Cu�ntas viviendas tiene la localidad de Puerto del Aire
SELECT TOP(1) L.nombre, L.viviendas
FROM [localidades] as L
WHERE L.municipio_id = 348 
ORDER BY L.altitud DESC

-- Cu�ntas viviendas tiene el municipo de Le�n
SELECT sum(L.viviendas)
FROM [localidades] as L
WHERE L.municipio_id = 348 

-- Ubique en un Google maps el poblado Puerto del Aire del Municipio de Le�n




-- JOIN
-- Cu�les son los municipios del estado de aguascalientes
SELECT * 
FROM [estados] as E
JOIN [municipios] as M
ON E.id = M.estado_id
WHERE E.id = 11 and M.clave='020' ;

-- Listar todas localidades del municipio de Le�n, estado Guanajuato.
-- Le�n estado.clave 12, municipio.clave 020
SELECT *
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')


-- Cual es el total de la poblaci�n de las localidades de Le�n
SELECT sum(L.poblacion) 
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')

-- Cu�l es el total de la problaci�n femenina de las localidades de Le�n
SELECT sum(L.femenino) 
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')

--Cu�l es la localidad que se encuentra en el punto m�s alto de Le�n
SELECT TOP(1) *
FROM [estados] AS E
JOIN [municipios] AS M
ON E.id = M.estado_id
JOIN [localidades] AS L
ON L.municipio_id = M.id
WHERE E.id=11 and (M.id=348 or M.clave='020')
ORDER BY L.altitud DESC



