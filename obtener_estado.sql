CREATE PROCEDURE `obtener_estado` (in busca_estado VARCHAR(39))
BEGIN
   SELECT *
   FROM estados
   WHERE clave = busca_clave;
END
