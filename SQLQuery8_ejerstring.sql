-- Mi nombre es Rubén
SELECT ASCII('R') AS R, ASCII('u') AS u,   
ASCII('b') AS b, ASCII('é') AS e, ASCII('n') AS n 

SELECT CHAR(82) + CHAR(117) + CHAR(98) + CHAR(233) + CHAR(110)

SELECT CONCAT('Hola ',CHAR(82),CHAR(117),CHAR(98),CHAR(233),CHAR(110))

SELECT LEFT('Esta es una oración',4)

SELECT LEN('Esta es una oración')

-- Procedimiento que envía diferentes mensajes 
CREATE PROCEDURE spr_concatena_mensaje_tipo5
 @nombre varchar(30),
 @tipo int
 AS
 DECLARE @mensaje varchar(50)
 SELECT @mensaje  = CHOOSE (@tipo, ' Bienvenido', ' Gracias por usar nuestros servicios', ' es un Usuario Inválido')
 SELECT CONCAT(@Nombre, @mensaje) as Salida

EXEC spr_concatena_mensaje_tipo5 'Rubén', 3
-- Procedimiento que formatea una cantidad en moneda
CREATE PROCEDURE SPR_Moneda
@cantidad float
AS
SELECT FORMAT(@cantidad, 'C', 'en_us') as 'Moneda'

EXEC SPR_Moneda 10000.35
-- Función que convierte de string a float
SELECT STR('1345.344',8,2)
-- Función que inserta un texto con otro
SELECT STUFF('Compañía Patito AC',16,3,' S.A. de C.V. de R.L.')

-- Nombre completo en ASCII
SET TEXTSIZE 0;  
--  
DECLARE @pos int, @cadena char(35);  
-- 
SET @pos = 1;  
SET @cadena = 'Rubén Miguel Rodríguez Rangel';  
WHILE @pos <= DATALENGTH(@cadena)  
   BEGIN  
   SELECT ASCII(SUBSTRING(@cadena, @pos, 1)),   
      CHAR(ASCII(SUBSTRING(@cadena, @pos, 1)))  
   SET @pos = @pos + 1  
   END;  
GO 

-- Charindex posición
DECLARE @document varchar(64);  
SELECT @document = 'Esta es la clase de Base de Datos' +  
                   ' para el grupo 537 de Actuaria.';  
SELECT CHARINDEX('grupo', @document); 
--
SELECT CHARINDEX ( 'TEST',  
       'This is a Test')

-- No importan las mayúsculas
SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CI_AS); 

-- Concatenar
SELECT CONCAT ( 'Feliz ', 'Cumpleaños ', 10, '/', '29' ) AS Result; 

-- Returns a DIFFERENCE value of 4, the least possible difference.  
SELECT SOUNDEX('Asia'), SOUNDEX('Hacia'), DIFFERENCE('Asia','Hacia');  
GO  
-- Returns a DIFFERENCE value of 0, the highest possible difference.  
SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  
GO

DECLARE @document VARCHAR(64)
SELECT @document = 'Una vez Ana me dijo' +
                   ' que me quería mucho .';
SELECT CHARINDEX('Ana', @document);
GO

CREATE PROCEDURE pro_charin
@document varchar(50),
@busqueda varchar(10)
AS
 SELECT charindex(@busqueda, @document)



EXEC pro_charin 'Una vez Ana SLECt me dijo que me quería mucho', 'Ana'

declare @mensaje varchar(100)
SELECT @mensaje = CHOOSE (3, 'Hola', 'Adios', 'Vuelve pronto')
SELECT CONCAT('Ruben ', @mensaje)

CREATE PROCEDURE pro_mensajeBanco 
@nombre varchar(100),
@nmsg int
AS
declare @mensaje varchar(100)
SELECT @mensaje = CHOOSE (@nmsg, 'Hola', 'Adios', 'Vuelve pronto')
SELECT CONCAT(@nombre,' ' , @mensaje)

EXEC pro_mensajeBanco 'Elizabeth', 3

CREATE PROCEDURE Nombre_ASCII
@Nombre varchar(20)
--@ApellidoM varchar(20),
--@ApellidoP varchar(20)
AS
DECLARE @i as int
DECLARE @l as varchar(1)
set @i = 1
set @l = ''
while @i <= DATALENGTH(@Nombre)
BEGIN
SET @l = SUBSTRING(@Nombre , @i, 1)
SET @i = @i + 1
print CONCAT(@l, ' = ', ASCII(@l))
END

EXEC Nombre_ASCII 'Jose García Gómez'















