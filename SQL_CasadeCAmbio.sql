-- Crear base de datos
create database bd_casaBolsa;
GO
use bd_casaBolsa;
-- Crear tabla divisas
DROP TABLE IF EXISTS tb_divisas;
GO
CREATE TABLE tb_divisas(
id_div INT IDENTITY(1,1),
abrev VARCHAR(3),
descripcion VARCHAR(100),
valor Money,
reserva money,
fecha_act DATE
);
GO
-- SP inserta_divisa
DROP PROCEDURE IF EXISTS sp_inserta_divisa;
GO
CREATE PROCEDURE sp_inserta_divisa
@divisa_abrev VARCHAR(3),
@divisa_titulo VARCHAR(100)
AS
   IF (dbo.existe_divisa(@divisa_abrev) = 0)
    BEGIN
       INSERT INTO tb_divisas (abrev, descripcion)
       VALUES (@divisa_abrev, @divisa_titulo);
	END;
   ELSE
     SELECT 'No insertado';
GO
-- Utiliza sp_inserta_divisa
exec sp_inserta_divisa 'USD', 'Dolar Americano';
exec sp_inserta_divisa 'EUR', 'Euro';
exec sp_inserta_divisa 'JPY', 'Yen Japonés';
exec sp_inserta_divisa 'GBP', 'Libra Esterlina';
exec sp_inserta_divisa 'CNY', 'Yuan Chino';
exec sp_inserta_divisa 'MNX', 'Peso Mexicano';
exec sp_inserta_divisa 'RUP', 'Rupia Rusa';

-- 
SELECT * 
FROM tb_divisas
-- actualiza
DROP PROCEDURE IF EXISTS sp_actualiza_divisa;
CREATE PROCEDURE sp_actualiza_divisa
@divisa_abrev VARCHAR(3),
@divisa_valor MONEY
AS
 UPDATE tb_divisas 
 SET valor = @divisa_valor,
     fecha_act = getdate()
 WHERE abrev = @divisa_abrev;
GO
-- ejecuta
exec sp_actualiza_divisa 'USD', 20.40;
exec sp_actualiza_divisa 'EUR', 21.53;
exec sp_actualiza_divisa 'JPY', 0.16;
exec sp_actualiza_divisa 'CNY', 3.07;
exec sp_actualiza_divisa 'GBP', 25.65;

CREATE PROCEDURE reserva_inicial 
      @abrev varchar(3),
	  @res_inicial money
	  as
	  UPDATE tb_divisas
	  SET reserva = @res_inicial
	  WHERE abrev = @abrev;

EXEC reserva_inicial 'USD', 200000

SELECT *
FROM tb_divisas;
-- crea venta
DROP TABLE IF EXISTS tb_venta_divisas;
GO
CREATE TABLE tb_venta_divisas(
id_venta INT IDENTITY(1,1),
ine VARCHAR(100),
abrev VARCHAR(3),
valor Money,
cantidad int,
total Money,
fecha_act DATE
);
GO
-- sp_venta_divisa
DROP PROCEDURE IF EXISTS sp_venta_divisa;
GO
CREATE PROCEDURE sp_venta_divisa
@divisa_abrev VARCHAR(3),
@divisa_cantidad INT,
@divisa_ine VARCHAR(100)
AS
  DECLARE @valor money
  SELECT @valor = valor
  FROM tb_divisas as d
  WHERE d.abrev = @divisa_abrev;
  INSERT INTO tb_venta_divisas
  (ine, abrev, valor, cantidad, total, fecha_act)
  VALUES
  (@divisa_ine,@divisa_abrev,@valor,
  @divisa_cantidad,@valor*@divisa_cantidad,getdate());
  UPDATE tb_divisas
  SET reserva = reserva - @divisa_cantidad
  WHERE abrev = @divisa_abrev;
GO
-- ejecuta
exec sp_venta_divisa 'USD',150000,'999999999999';

SELECT *
FROM tb_venta_divisas;

-- consulta divisa
DROP PROCEDURE IF EXISTS sp_consulta_divisa;
GO
CREATE PROCEDURE sp_consulta_divisa
@divisa_abrev VARCHAR(3),
@divisa_valor money OUTPUT
AS
  SELECT @divisa_valor = valor
  FROM tb_divisas as d
  WHERE d.abrev = @divisa_abrev;
GO

DECLARE @valor money;
exec sp_consulta_divisa 'JPY', @valor output;
SELECT @valor

select *
from tb_divisas

-- opción 2
DROP PROCEDURE IF EXISTS sp_venta_divisa_v2;
GO
CREATE PROCEDURE sp_venta_divisa_v2
@divisa_abrev VARCHAR(3),
@divisa_cantidad INT,
@divisa_ine VARCHAR(100)
AS
  DECLARE @valor money
  exec sp_consulta_divisa 'USD', @valor output;
  INSERT INTO tb_venta_divisas
  (ine, abrev, valor, cantidad, total, fecha_act)
  VALUES
  (@divisa_ine,@divisa_abrev,@valor,@divisa_cantidad,@valor*@divisa_cantidad,getdate());
GO
-- ejecuta
exec sp_venta_divisa_v2 'USD',100,'mi ine';

SELECT *
FROM tb_divisas;

CREATE FUNCTION existe_divisa(@divisa VARCHAR(3))
RETURNS INT
AS
  BEGIN
    DECLARE @existe INT;
    SELECT @existe=COUNT(id_div) 
	FROM tb_divisas as d
	WHERE d.abrev = @divisa;
	RETURN(@existe);
  END;

select dbo.existe_divisa('RUP')