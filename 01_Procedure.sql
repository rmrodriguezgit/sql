CREATE PROCEDURE pro_matricula
@Matricula VARCHAR (8)
AS
SELECT CONCAT_WS('-',REPLICATE ('0', 8-datalength(@Matricula))+@Matricula,LEN(@Matricula) )

EXECUTE pro_matricula '71391211'
00071392-5

CREATE PROCEDURE Correos3
@Nombre varchar(50)
AS
DECLARE @Resul VARCHAR(10)
DECLARE @Numero int =len(@Nombre)
SET @Nombre = TRIM(@Nombre)
SET @Resul = LEFT(@Nombre,1);
WHILE CHARINDEX(' ',@Nombre,1)>0 BEGIN
SET @Nombre=LTRIM(RIGHT(@Nombre,LEN(@Nombre)-CHARINDEX(' ',@Nombre,1)));
SET @Resul += LEFT(@Nombre,1)
END
SELECT CONCAT(LOWER(@Resul),@Numero,'@actuarios.com') AS 'Correo'
EXECUTE Correos3 'Karla Andrea Velazquez Velazquez'

CREATE PROCEDURE pro_correo_longitud
@nombre varchar(50)
AS
DECLARE
@resultado VARCHAR(8),
@longitud VARCHAR(50)
SET @longitud=@nombre
SET @nombre = TRIM(@nombre)
SET @resultado = LEFT(@nombre,1);
WHILE CHARINDEX(' ',@nombre,1)>0
BEGIN
SET @nombre=LTRIM(RIGHT(@nombre,LEN(@nombre)-CHARINDEX(' ',@nombre,1)));
SET @resultado += LEFT(@nombre,1)
END
SELECT CONCAT(LOWER(@resultado),Len(@longitud),'@actuarios.com') AS 'Correo'

EXECUTE pro_correo_longitud 'Mildred Etienne Granillo Leal'

CREATE PROCEDURE Pro_matr2
@matricula Varchar(8)
AS
SELECT CONCAT(REPLICATE( '0', 8-datalength(@matricula)) + @matricula, '-', LEN(@matricula));
EXECUTE Pro_matr2 '70144'


CREATE PROCEDURE PRO_COTIZACIONES1 
@DOLLAR money, @YENES money, @YUANES money 
AS 
IF EXISTS(SELECT name FROM sys. tables WHERE name = 'CAMBIO') 
DROP TABLE CAMBIO 

CREATE TABLE CAMBIO ( DOLLAR MONEY, YENES MONEY, YUANES MONEY ) 
INSERT INTO CAMBIO VALUES (@DOLLAR, @YENES, @YUANES) 
SELECT * FROM CAMBIO 
GO 
EXECUTE PRO_COTIZACIONES1 1000, 25500, 56054 

DOLLAR 1000.00 YENES 25500.00 YUANES 56054.00


CREATE PROCEDURE Pro_fech_Idiom 
@fecha DATE, @idiom varchar(10) 
AS 
SET LANGUAGE @idiom 

SELECT Concat(DATENAME(DW, @fecha), ' ', DATEPART(DD, @fecha), ' ', DATENAME(MM, @fecha), ' ', DATEPART(YY, @fecha) ) As Fecha 

EXEC Pro_fech_Idiom '24/07/2000', 'italian'

CREATE PROCEDURE pro_contra @contraseña 
varchar(20) 
As 
BEGIN 
  IF @contraseña = 'contraseña' GOTO Branch_One; 
  ELSE GOTO Branch_Two 
  END 
  Branch_One: SELECT 'Contraeña correcta.' 
              GOTO salida 
  Branch_Two: SELECT 'Intente de nuevo.' 
              GOTO salida 
  salida: SELECT 'fin' 

EXECUTE pro_contra 'Contraseña1' 
--
Create procedure Fibonacci
@elementos as int
AS
DECLARE @i int,
@a int,
@b int,
@c int,
@total int
SET @i = 1
SET @a = 1
SET @b = 1
SET @total = 2
PRINT @a
PRINT @b
WHILE @i <= @elementos
Begin
SET @c = @a + @b
PRINT @c
SET @a = @b
SET @b = @c
SET @i = @i + 1
SET @total = @total + @c
End
Print CONCAT('El total es: ', @total​)

exec Fibonacci 40

CREATE PROCEDURE pro_ASCII_2
--variables
@ASCII VARCHAR(200)
AS
DECLARE @value varchar(200), @pos int
SET @value = STRING_SPLIT(@ASCII,' ')

SET @pos = 1
WHILE @pos <= 50
BEGIN
SELECT CHAR(@value),
SET @pos = @pos + 1
END;

EXEC pro_ASCII_1 '64 115 116 97 32 101 115 32 117 110 97 32 112 114 101 103 117 110 116 97 32 100 101 32 101 120 97 109 101 110 32 118 97 108 11 114 32 49 32 112 117 110 116 111'


CREATE PROCEDURE Creacorreo
@Nombre varchar(50)
AS
DECLARE @Resultado VARCHAR(10)
DECLARE @Numero int =len(@Nombre)
SET @Nombre = TRIM(@Nombre)
SET @Resultado = LEFT(@Nombre,1);
WHILE CHARINDEX(' ',@Nombre,1)>0 BEGIN
SET @Nombre=LTRIM(RIGHT(@Nombre,LEN(@Nombre)-CHARINDEX(' ',@Nombre,1)));
SET @Resultado += LEFT(@Nombre,1)
END
SELECT CONCAT(LOWER(@Resultado),@Numero,'@actuarios.com') as Correo


EXECUTE Creacorreo 'Leonardo Damian Cortes Fernandez '


CREATE PROCEDURE seriesuma AS

IF EXISTS(SELECT name FROM sys.tables
WHERE name = 'Fib')
DROP TABLE Fib;
CREATE TABLE Fib(
i int, Fibonacci int);

DECLARE @i int,
@a int,
@b int,
@c int,
@suma int
SET @i=1
SET @a=1
SET @b=1
PRINT @a
PRINT @b
WHILE @i<=40
Begin
SET @c= @a+@b
INSERT INTO Fib VALUES (@i, @c)
SET @a=@b
SET @b=@c
SET @suma = @suma+@c
SET @i=@i+1
End

EXEC seriesuma

CREATE PROCEDURE Pro_Correo
@Nombre varchar(50)
AS
DECLARE @Resultado VARCHAR(10)
DECLARE @Numero int =len(@Nombre)
SET @Nombre = TRIM(@Nombre)
SET @Resultado = LEFT(@Nombre,1);
WHILE CHARINDEX(' ',@Nombre,1)>0 BEGIN
SET @Nombre=LTRIM(RIGHT(@Nombre,LEN(@Nombre)-CHARINDEX(' ',@Nombre,1)));
SET @Resultado += LEFT(@Nombre,1)
END
SELECT CONCAT(LOWER(@Resultado),@Numero,'@actuariosdelasalle.edu.mx') AS 'Correo'
EXECUTE Pro_Correo'Daniela Karina Suárez García'


Realizar un procedimiento almacenado que reciba una matrícula de entre 1 a 8 posiciones, completar con ceros las posiciones a la izquierda, además agregue un guión y el número de caracteres de la matrícula original. Muestre el resultado de la ejecución.
Ejemplo: 3891 -> 00003891-4      12345 -> 00012345-5
CREATE PROCEDURE MATRICULA1
@Matr VARCHAR (8)
AS
SELECT CONCAT_WS('-',REPLICATE ('0', 8-datalength(@Matr))+@Matr,LEN(@Matr) );
GO
EXECUTE MATRICULA1 '72075'

DECLARE @i int,
@a int,
@b int,
@c int
SET @i=1
SET @a=1
SET @b=1
PRINT @a
PRINT @b
WHILE @i<=40
Begin
SET @c= @a+@b
PRINT @C
SET @a=@b
SET @b=@c
SET @i=@i+1
End


CREATE PROCEDURE correo
@Nombre varchar(50)
AS
DECLARE @Resultado VARCHAR(10)
SET @Nombre = TRIM(@Nombre)
SET @Resultado = LEFT(@Nombre,1);
WHILE CHARINDEX(' ',@Nombre,1)>0 BEGIN
SET @Nombre=LTRIM(RIGHT(@Nombre,LEN(@Nombre)-CHARINDEX(' ',@Nombre,1)));
SET @Resultado += LEFT(@Nombre,1)
END
SELECT CONCAT(LOWER(@Resultado),LEN(@Nombre),'@gmail.com') AS 'Correo';
GO
EXECUTE correo 'Gabriel Hernández Domínguez'

CREATE PROCEDURE pro_mail
@nombres varchar(50)
AS
SELECT CONCAT(LOWER(LEFT(@nombres,1)),LOWER(SUBSTRING(@nombres,CHARINDEX(' ', @nombres)+1,1)),(LEN(@nombres)),'@actuarios.com');
GO
EXEC pro_mail 'Margarita Rodriguez Rangel'

CREATE PROCEDURE pro_email7
@nombre VARCHAR(20),
@ape VARCHAR(20)
AS
DECLARE @nomnom INT;
SET @nomnom = CHARINDEX(' ', RTRIM(@nombre));
IF @nomnom = 0
BEGIN
DECLARE @correo varchar (50) =
lower(LEFT(@nombre, 1) + RTRIM(@ape) + '@actuaria.mx');
PRINT @correo + str(len(@correo))

END
BEGIN
DECLARE @correo1 varchar (50)
= LOWER(LEFT(@nombre,1) + SUBSTRING(@nombre,CHARINDEX(' ', @nombre)+1,1) + LOWER(LEFT(@ape,1) +
SUBSTRING(@ape,CHARINDEX(' ', @ape)+1,1)+ '@actuaria.mx'))
PRINT @correo1 + str(len(@correo1))
END

EXEC pro_email7 'Daniel Isaac', 'López Espinosa'

CREATE PROCEDURE MATRICULA1
@Matr VARCHAR (8)
AS
SELECT CONCAT_WS('-',REPLICATE ('0', 8-datalength(@Matr))+@Matr,LEN(@Matr) );
GO

EXECUTE MATRICULA1 '265777'

DECLARE @Mensaje VARCHAR(999)
SET @Mensaje = '64 115 116 97 32 101 115 32 117 110 97 32 112 114 101 103 117 110 116 97 32 100 101 32 101 120 97 109 101 110 32 118 97 108 11 114 32 49 32 112 117 110 116 111'

DECLARE @espacios int;
SET @espacios = CHARINDEX(' ',@Mensaje,0)

WHILE @espacios > 0 BEGIN
PRINT(CHAR(SUBSTRING(@Mensaje,0,@espacios)))
SET @Mensaje = SUBSTRING(@Mensaje,@espacios+1,999)
SET @espacios = CHARINDEX(' ',@Mensaje)
END
PRINT(CHAR(@Mensaje))
GO

select
CHAR(64), char(115), char(116), char(97), char(32), char(101), char(115), char(32), char(117), char(110), char(97), char(32), char(112), char(114), char(101), char(103),
char(117), char(110), char(116), char(97), char(32), char(100), char(101), char(32), char(101), char(120), char(97), char(109), char(101), char(110), char(32), char(118),
char(97), char(108), char(11), char(114), char(32), char(49), char(32), char(112), char(117), char(110), char(116), char(111);

CREATE PROCEDURE FIBONACCI3
AS

--IF EXISTS(SELECT name FROM sys.tables
--WHERE name = 'Fib')
--DROP TABLE Fibo;

CREATE TABLE Fibo3(
i int, Fibonacci int);

DECLARE @i int,
@a int,
@b int,
@c int,
@suma int
SET @i=1
SET @a=1
SET @b=1
PRINT @a
PRINT @b
WHILE @i<=40
Begin
SET @c= @a+@b
INSERT INTO Fibo3 VALUES (@i, @c)
SET @a=@b
SET @b=@c
SET @suma = @suma+@c
SET @i=@i+1
End
SELECT SUM(Fibonacci) FROM Fibo3;
GO

EXECUTE FIBONACCI2

CREATE PROCEDURE Fibonacci40
@tamaño int
AS
IF EXISTS(SELECT name FROM sys. tables
WHERE name = 'fibo')
DROP TABLE fibo
CREATE TABLE fibo
(
numeros int
);

DECLARE @n1 int = 0,@n2 int =1,@i int=0,@temp int
INSERT INTO fibo VALUES(@n1),(@n2)
WHILE (@i<=@tamaño-3)
BEGIN
INSERT INTO fibo VALUES(@n2+@n1)
SET @temp = @n2
SET @n2 = @n2 + @n1
SET @n1 = @temp
SET @i += 1
END
SELECT *
FROM fibo

SELECT SUM(numeros)
FROM fibo
GO

EXECUTE Fibonacci40 40