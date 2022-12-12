CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualiza_divisa`(in divisa_abrev VARCHAR(3), divisa_valor DECIMAL(19,2) )
BEGIN
UPDATE tb_divisas 
SET valor = divisa_valor,
     fecha_act = now()
WHERE abrev = divisa_abrev and id_div>0;
END