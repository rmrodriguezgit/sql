CREATE PROCEDURE `obtener_municipios` (in busca_estado VARCHAR(39))
BEGIN
   SELECT *
   FROM estados E
   JOIN municipios M
   ON 
   E.clave = M.estado_id
   WHERE E.clave = busca_estado;
END
