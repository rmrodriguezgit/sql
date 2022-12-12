CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta_divisa`(in divisa_abrev varchar(3), divisa_cantidad int, divisa_ine varchar(100))
BEGIN
  declare v_valor decimal(19,2);
  declare v_existe int;
  
  SELECT count(cliente_id) INTO v_existe
  WHERE ine = divisa_ine;
  if v_existe > 0 then   
	  SELECT valor INTO v_valor
	  FROM tb_divisas  d
	  WHERE d.abrev = divisa_abrev;
	  INSERT INTO tb_venta_divisas
	  (ine, abrev, valor, cantidad, total, fecha_act)
	  VALUES
	  (divisa_ine,divisa_abrev,v_valor,divisa_cantidad,v_valor*divisa_cantidad,now());
	  UPDATE tb_divisas
	  SET reserva = reserva - divisa_cantidad
	  WHERE abrev = divisa_abrev;
  end if
END