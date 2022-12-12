USE inegi
--https://www.guru99.com/group-by.html

SELECT 
FROM 
JOIN
ON
JOIN 
ON











-- Muestre los municipios y el número de localidades
SELECT e.id, e.nombre, m.id, m.nombre, 
       count(l.id) as [Localidades por Municipio]
FROM estados as E
JOIN municipios as M
ON E.id = M.estado_id
JOIN localidades as L
ON L.municipio_id = M.id
GROUP BY e.id, e.nombre, m.nombre, m.id

-- Muestre los municipios con mayor número de localidades  
SELECT e.id, e.nombre, m.id, m.nombre, count(l.id)
FROM estados as E
JOIN municipios as M
ON E.id = M.estado_id
JOIN localidades as L
ON L.municipio_id = M.id
GROUP BY e.id, e.nombre, m.nombre, m.id
ORDER BY count(l.id) DESC

-- Muestre las localidades, agrupadas por estado, municipio
SELECT e.id, e.nombre, m.id, m.nombre, l.id, l.nombre
FROM estados as E
JOIN municipios as M
ON E.id = M.estado_id
JOIN localidades as L
ON L.municipio_id = M.id
GROUP BY e.id, e.nombre, m.nombre, m.id, l.id, l.nombre


-- Muestre las localidades, agrupadas por estado, 
-- municipio León 348
SELECT e.id, e.nombre, m.id, m.nombre, l.id, l.nombre
FROM estados as E
JOIN municipios as M
ON E.id = M.estado_id
JOIN localidades as L
ON L.municipio_id = M.id
GROUP BY e.id, e.nombre, m.nombre, m.id, l.id, l.nombre
HAVING M.id = 348
ORDER BY l.nombre;

-- Muestre la cantidad de municipios por estado, 
-- agrupe por nombre estado
SELECT e.id, e.nombre, count(m.id) as [Num Municipios]
FROM estados as E
JOIN municipios as M
ON E.id = M.estado_id
GROUP BY e.id, e.nombre
ORDER BY count(m.id) DESC

