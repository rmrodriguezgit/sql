USE inegi;

CREATE PROCEDURE numero_municipios
--Variables tipo entrada y salida
@busca_estado VARCHAR(2),
@numero_municipios INT OUTPUT
AS
     SELECT @numero_municipios = Count(M.clave)
	 FROM estados E
    JOIN municipios M
    ON 
    E.clave = M.estado_id
	WHERE E.clave = @busca_estado
-- Ejecución
DECLARE @num INT
EXEC numero_municipios '11', @num OUTPUT
SELECT @num


CREATE PROCEDURE obtener_estado 
@busca_estado VARCHAR(39), 
@num_mun INT output
AS
   SELECT @num_mun = count(M.clave) 
   FROM estados E
   JOIN municipios M
   ON 
   E.clave = M.estado_id
   WHERE E.clave = @busca_estado;

DECLARE @num_mun INT
EXECUTE  obtener_estado '14', @num_mun output
SELECT @num_mun


SELECT *
FROM estados as E
JOIN municipios as M
ON E.clave = M.estado_id
WHERE M.nombre = 'León'

CREATE PROCEDURE busca_municipio3
@busca_mun VARCHAR(100)
AS
	SELECT *
	FROM estados as E
	JOIN municipios as M
	ON E.clave = M.estado_id
	WHERE M.nombre like '%'+@busca_mun+'%'

EXEC busca_municipio3 'León'

