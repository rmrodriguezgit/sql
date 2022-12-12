-- ASCII
-- @  ALT 064 ñ 164 Ñ 165 
-- 1. Ponga su nombre completo en ASCII
-- 2. Utilizando un ciclo while, 
--    haga un procedimiento para recorrer 
--    todo su nombre poniendo su carácter y su equivalente en ASCII

SELECT ASCII('@') AS arroba
-- 'Rubén Miguel Rodríguez Rangel'
SELECT ASCII('R') AS R,ASCII('u') AS u,ASCII('b') AS b,ASCII('é') AS é, ASCII('n') AS n, ASCII(' ') AS espacio
-- 2.
SET TEXTSIZE 0;  
-- Create variables for the character string and for the current   
-- position in the string.  
DECLARE @position int, @string char(100),  @nombreConcat char(100), @con Char(1)
-- Initialize the current position and the string variables.  
SET @position = 1;  
SET @con=''
--SET @string = 'Rubén Miguel Rodríguez Rangel';  
SET @string = 'Ana Paula Gómez Maldonado' 
SET @nombreConcat = ''
SELECT @nombreConcat
-- SELECT LEN(@string) 
-- SET @nombreConcat = rtrim(@nombreConcat)+ ' Mundo'
-- SET @nombreConcat =       @nombreConcat + ' Mundo'
SELECT @nombreConcat as [Nombre Concatenado]

WHILE @position <= LEN(@string)  
   BEGIN  
   SET @nombreConcat = CONCAT(rtrim(@nombreConcat),CHAR(ASCII(SUBSTRING(@string, @position, 1)))) 
    SET @nombreConcat = @nombreConcat + @con
    SET @position = @position + 1  
   END  
   SELECT @nombreConcat
GO 


-- Charindex 
SELECT CHARINDEX('is', 'This is a string');

SELECT CHARINDEX('is', 'This is a string',5); 

SELECT CHARINDEX('str', 'This is a string');

SELECT CHARINDEX('i', 'This is a string',8);

SELECT CHARINDEX(' ', 'Ricardo Antonio'); -- Me regresa 8

SELECT CHARINDEX(' ', RTRIM('Ricardo    '));

-- Ricardo  
-- Antonio   
-- Normalizar

SELECT LEFT('Ricardo Antonio',CHARINDEX(' ', 'Ricardo Antonio')-1);

SELECT RIGHT('Ricardo Antonio', LEN('Ricardo Antonio')-CHARINDEX(' ', 'Ricardo Antonio'));
                                            17             -                  8

CREATE PROCEDURE pro_ObtieneSegundoNombre
@nombres varchar(50)
AS
 SELECT RIGHT(@nombres, LEN(@nombres)-CHARINDEX(' ', @nombres));

EXEC pro_ObtieneSegundoNombre 'Eugenia'
-- Me devuelve el caracter de inicio del segundo nombre  
SELECT LOWER(SUBSTRING('Ricardo Antonio',CHARINDEX(' ', 'Ricardo Antonio')+1,1))
SELECT LOWER(LEFT('Ricardo Antonio',1))
SELECT CONCAT(LOWER(LEFT('Ricardo Antonio',1)),LOWER(SUBSTRING('Ricardo Antonio',CHARINDEX(' ', 'Ricardo Antonio')+1,1)),
              '100100','@actuariosdelasalle.edu.mx')
-- Crear un email a partir de las iniciales de los nombres del empleado
CREATE PROCEDURE pro_email
@nombres varchar(50),
@matricula varchar(8)
AS
SELECT CONCAT(LOWER(LEFT(@nombres,1)),LOWER(SUBSTRING(@nombres,CHARINDEX(' ', @nombres)+1,1)),
              @matricula,'@actuariosdelasalle.edu.mx')

EXEC pro_email 'Israel Antonio', '70644'

SELECT RTRIM('José Eduardo          ')
SELECT CHARINDEX(' ', RTRIM('José Eduardo'));

DECLARE @nombres char(100), @apa char(100), @numnom int;
SET @nombres = 'José Eduardo Antonio';  -- itorres@actuaria.mx
SET @apa = 'Torres';
SET @numnom = CHARINDEX(' ', RTRIM(@nombres));
IF @numnom = 0 
  Begin
   PRINT 'Solo tiene un nombre' 
   PRINT  lower(LEFT(@nombres,1) +RTRIM(@apa) +'@actuaria.mx');
  End
ELSE
  Begin
   PRINT 'Tiene 2 o más nombres'
   PRINT lower(LEFT(@nombres,1) + SUBSTRING(@nombres,CHARINDEX(' ', @nombres)+1,1) 
         +RTRIM(@apa)+ '@actuaria.mx')
  End
-- PA
CREATE PROCEDURE Pro_Correo2
@nombres char(100), @apa char(100)
AS
DECLARE @numnom int
SET @numnom = CHARINDEX(' ', RTRIM(@nombres));
IF @numnom = 0 
  Begin
   PRINT 'Solo tiene un nombre' 
   PRINT  lower(LEFT(@nombres,1) +RTRIM(@apa) +'@actuaria.mx');
  End
ELSE
  Begin
   PRINT 'Tiene 2 o más nombres'
   PRINT lower(LEFT(@nombres,1) + SUBSTRING(@nombres,CHARINDEX(' ', @nombres)+1,1) 
         +RTRIM(@apa)+ '@actuaria.mx')
  End

EXEC Pro_Correo2 'Fernando', 'Noyola'

-- Sintaxis de la instrucción IF ELSE
IF <Condición>
  Begin 
    ...
  End
ELSE
  Begin
    ...
  End

DECLARE @document varchar(64);    
SELECT @document = 'Las bolsas de aire son recursos de seguridad' +  
                   ' y forman parte de tu vehículo';  
SELECT CHARINDEX('auto', @document);  
GO 

DECLARE @document varchar(64);    
SELECT @document = 'Las bolsas de aire son recursos de seguridad' +  
                   ' y forman parte de tu vehiculo';  
SELECT CHARINDEX('aire', @document);  
GO 

-- CI CS
-- Uso en Password
SELECT CHARINDEX ( 'PRUEBA',  
       'Esta es una Prueba'  
       COLLATE Latin1_General_CS_AS);  
-- Uso en Buscadores
SELECT CHARINDEX ( 'PrUeBA',  
       'Esta es una Prueba'  
       COLLATE Latin1_General_CI_AS); 
-- Cómo crear una tabla temporal
-- Uso: requieren las cotizaciones del día
--      borrra la tabla anterior
--      siempre tendrás los datos más actuales
IF EXISTS(SELECT name FROM sys.tables  
      WHERE name = 't1')  
   DROP TABLE t1;  
GO  
CREATE TABLE t1   
(  
 c1 varchar(3),  
 c2 char(3)  
);  
GO  
INSERT INTO t1 VALUES ('2', '2'), ('37', '37'),('597', '597');  
GO  
SELECT REPLICATE('0', 8 - LEN(c1)) + c1 AS 'Varchar Column',  
       REPLICATE('0', 3 - LEN(c2)) + c2 AS 'Char Column'  
FROM t1;  
GO  

-- Crear una tabla de cotizaciones del USD, Euro, Yen, Yuán con respecto al peso
-- 1 USD - $20.27 pesos
-- 1 Euro - $23.84 pesos
-- 1 Yen - $0.18 pesos
-- 1 Yuán - $3.13 pesos

CREATE PROCEDURE Casa_Cambio2
@usd money,
@euro money,
@yen money,
@yuan money
AS
IF EXISTS(SELECT name FROM sys.tables  
      WHERE name = 't1')  
   DROP TABLE t1;  
 
CREATE TABLE t1   
(  
  usd money,
  euro money,
  yen money,
  yuan money
);  
  
INSERT INTO t1 VALUES (@usd, @euro,@yen, @yuan);  
  
SELECT *  
FROM t1;  
  
EXEC Casa_Cambio2 20.27,23.84, 0.18, 3.13
EXEC Casa_Cambio 21.32,23.84, 0.18, 3.13

-- Pon aquí tu matrícula 68307
-- Debe de aparecer 00068307
-- Utiliza la instrucción REPLICATE para rellenar con ceros a la izquierda de la matrícula
DECLARE @matricula varchar(8);
SET @matricula = '3671'
SELECT @matricula as [Matricula Alumno]

-- Completar con ceros
DECLARE @m1 varchar(8);
SET @m1='68283'
SELECT REPLICATE('0',8-DATALENGTH(@m1))+@m1

-- 
declare @matricula char(5)
set @matricula = '69802'
select replicate ('0',8 -datalength(@matricula)) + @matricula

--04000000  pos 2 = 4 JAT
--03000000  pos 2 = 3 SAL
-- ANITALAVALATINA  - Palíndroma
DECLARE @myvar varchar(10);  
SET @myvar = 'sdrawkcaB';  
SELECT REVERSE(@myvar) AS Reversed ;  
GO  

DECLARE @myvar varchar(20);  
SET @myvar = 'RORR691029HGTDNB01';  
SELECT REVERSE(@myvar) AS Reversed ;  
GO  

-- curp 'RORR691029HGTDNB01'
-- Palíndroma
-- 
DECLARE @myvar varchar(15);  
SET @myvar = 'ANITALAVALATINA';  
SELECT REVERSE(@myvar) AS Reversed ;  
GO 

-- Decimal
SELECT STR(123.4955, 6, 2);  
GO 

-- 1523.60     --- 1523.5950
SELECT STR(1523.5950, 8, 2);  
GO

-- 0.00044647
-- BTC 0.00987953 
SELECT STR(0.00987953,10,8);
GO

-- CUATROCIENTOS MIL PESOS 50/100 .50 CENTAVOS
-- CSV , Se usa normalmente en excel para exportar información

SELECT value FROM STRING_SPLIT('Lorem,ipsum,dolor,sit,amet.', ',');

SELECT STUFF('abcdef', 2, 3, 'ijklmn');  
GO

SELECT STUFF('ABCDEF', 2, 3, 'abcdef');  
GO

SELECT STUFF('000PG0499', 4, 2, 'DY');  -- DY
GO


