CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_divisa`(in divisa_abrev VARCHAR(3), divisa_titulo VARCHAR(100))
BEGIN
INSERT INTO tb_divisas (abrev, descripcion)
   VALUES (divisa_abrev, divisa_titulo);
END