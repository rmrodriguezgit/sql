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

-- Cu�les son los municipios del estado de Aguascalientes
-- Cu�les son los municipios de cualquier estado

-- Cu�ntos municipios tiene el estado de Ags
-- Cu�les son los municipios del estado de Jalisco
-- Cu�les son los municipios del estado de Guanajuato
-- Cu�ntos municipios tiene Oaxaca

-- Cu�l es el total de poblaci�n
-- Cu�l es la totalidad de poblaci�n masculino
-- *Cu�l es la totalidad de poblaci�n femenino en Jalisco
-- Cu�l es la cantidad de viviendas en Guerrero
-- Cu�l es el municipio con mayor cantidad de poblaci�n en Nuevo Le�n
-- Cu�l es el municipio con menor cantidad de poblaci�n en Sonora

-- Ubique la localidad Loza de los Padres
-- Cu�l es su poblaci�n de Loza de los Padres
-- Cu�l es el id del municipio de Le�n
-- Cu�l es la poblaci�n del municipio de Le�n 
-- Cu�l es la altitud del poblado m�s alto y m�s bajo (2 querys)

-- Cu�ntas viviendas tiene la localidad de Puerto del Aire
-- Cu�ntas viviendas tiene el municipo de Le�n
-- Ubique en un Google maps el poblado Puerto del Aire del Municipio de Le�n

-- JOIN
-- Cu�les son los municipios del estado de aguascalientes

-- Listar todas localidades del municipio de Le�n, estado Guanajuato.
-- Le�n estado.clave 12, municipio.clave 020

-- Cual es el total de la poblaci�n de las localidades de Le�n

-- Cu�l es el total de la problaci�n femenina de las localidades de Le�n

-- Cu�l es la localidad que se encuentra en el punto m�s alto de Le�n















