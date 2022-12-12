USE inegi;

--
SELECT *
FROM estados as E
JOIN municipios as M
ON e.clave = m.estado_id
WHERE m.nombre LIKE '%León%'


CREATE PROCEDURE buscar_municipio
 @busqueda VARCHAR(100)
AS
	SELECT *
	FROM estados as E
	JOIN municipios as M
	ON e.clave = m.estado_id
	WHERE m.nombre LIKE '%'+@busqueda+'%';

EXEC buscar_municipio 'Zapopan'