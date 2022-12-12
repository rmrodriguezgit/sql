USE INEGI

SELECT count(*)
FROM localidades

USE inegi;

SELECT Count(*) 
FROM Localidades

-- Uso de Alias
SELECT ES.id, ES.nombre, ES.abrev, ES.clave, ES.activo
FROM estados AS ES

SELECT count(*) as [Total de Estados]
FROM estados AS ES
SELECT * 
FROM estados AS ES

SELECT *
FROM municipios AS M
WHERE M.estado_id = 20

-- Uso de comodines
LIKE '%A'   -- Busca todas las terminaciones con A
LIKE 'A%'   -- Busca todo lo que empiece con A
LIKE '%A%'  -- Busca todo que contenga una A

SELECT *
FROM estados AS E
JOIN municipios AS M
ON E.id = M.estado_id
WHERE E.nombre LIKE '%Oaxaca%'

SELECT count(l.femenino) as [Femenino]
FROM estados AS E
JOIN municipios AS M
ON E.id = M.estado_id
JOIN localidades AS L
ON M.id = L.municipio_id
WHERE E.nombre LIKE '%Jalisco%'


SELECT * FROM [estados]

SELECT TOP(1000)* from [municipios];

SELECT TOP(1000)* from [localidades];

-- Cuáles son los municipios del estado de Aguascalientes
-- Cuáles son los municipios de cualquier estado

-- Cuántos municipios tiene el estado de Ags
-- Cuáles son los municipios del estado de Jalisco
-- Cuáles son los municipios del estado de Guanajuato
-- Cuántos municipios tiene Oaxaca

-- Cuál es el total de población
-- Cuál es la totalidad de población masculino
-- *Cuál es la totalidad de población femenino en Jalisco
-- Cuál es la cantidad de viviendas en Guerrero
-- Cuál es el municipio con mayor cantidad de población en Nuevo León
-- Cuál es el municipio con menor cantidad de población en Sonora

-- Ubique la localidad Loza de los Padres
-- Cuál es su población de Loza de los Padres
-- Cuál es el id del municipio de León
-- Cuál es la población del municipio de León 
-- Cuál es la altitud del poblado más alto y más bajo (2 querys)

-- Cuántas viviendas tiene la localidad de Puerto del Aire
-- Cuántas viviendas tiene el municipo de León
-- Ubique en un Google maps el poblado Puerto del Aire del Municipio de León

-- JOIN
-- Cuáles son los municipios del estado de aguascalientes

-- Listar todas localidades del municipio de León, estado Guanajuato.
-- León estado.clave 12, municipio.clave 020

-- Cual es el total de la población de las localidades de León

-- Cuál es el total de la problación femenina de las localidades de León

-- Cuál es la localidad que se encuentra en el punto más alto de León















