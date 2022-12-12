DECLARE @nombreCompleto VARCHAR(65), @espacio INT, @Nombre VARCHAR(65), @c INT;
SET @nombreCompleto = 'Rubén Miguel Rodríguez Rangel';
SELECT * FROM STRING_SPLIT(@nombreCompleto,' ');
SET @c=1;
WHILE @c<5
BEGIN
	SET @espacio=CHARINDEX(' ',@nombreCompleto,0)
	IF @espacio <> 0 
	  BEGIN
		SET @Nombre = LEFT(@nombreCompleto,@espacio-1);
		SET @nombreCompleto = RIGHT(@nombreCompleto,LEN(@nombreCompleto)-@espacio);		
      END
	ELSE
	  BEGIN
	    SET @Nombre = @nombreCompleto;
      END
    SELECT @Nombre AS [Nombre];
	SET @c = @c + 1;
END


DECLARE @nombreCompleto VARCHAR(65), @espacio INT, @Nombre VARCHAR(65), @c INT;
SET @nombreCompleto = 'Rubén Miguel Rodríguez Rangel';
SET @espacio=CHARINDEX(' ',@nombreCompleto,0);
SELECT @nombreCompleto as [nombre], @espacio as [primer espacio];

-- Uso del While
-- Despliegue en pantalla los números del 1 al 99
DECLARE @c INT;
SET @c = 1;
WHILE @c < 100 
   BEGIN
      SELECT @c;
	  SET @c = @c + 1;
   END

-- Despliegue los números pares entre 1 y 100
DECLARE @c INT;
SET @c = 2;
WHILE @c <= 100 
   BEGIN
      SELECT @c;
	  SET @c = @c + 2;
   END

-- Despliegue los números nones entre 1 y 100
-- Despliegue la serie 1,5,10,15,20,25... hasta el 100
-- Despliegue una cuenta regresiva de 10 a 0

-- Haga una lista del 1 al 100 imprimiendo el valor del número y si es par o  impar
DECLARE @c INT;
SET @c = 1;
WHILE @c <= 100 
   BEGIN
      IF @c % 2 = 0
	    BEGIN
	     SELECT @c AS [Número], 'Par';
        END
	  ELSE
	    BEGIN
	     SELECT @c AS [Número], 'Impar';
        END 
	  SET @c = @c + 1;
   END

-- De un valor a @c y diga si el número es primo o no
DECLARE @c INT, @k INT, @primo INT;
set @k = 2;

  set @c = 4;
  set @primo = 1;
    WHILE @k < @c
	  BEGIN
	     IF @c % @k = 0 
		   BEGIN
		     SET @primo = 0;
		   END
         SET @k = @k + 1;
	  END 
    IF @primo = 0 
	   SELECT 'El número ',@c,'No es primo';   
    ELSE
	   SELECT 'El número ',@c,'Si es primo'; 
	
  

-- Haga un programa que despliegue todas las letras indiduales de un nombre de longitud indeterminada
DECLARE @nombreCompleto VARCHAR(65), @longitud INT, @Nombre VARCHAR(65), @c INT;
SET @nombreCompleto = 'Rubén Miguel Rodríguez Rangel';

SET @longitud = LEN(@nombreCompleto);
SET @c = 1;
WHILE @c <= @longitud
  BEGIN
     SELECT SUBSTRING(@nombreCompleto,@c,1);
	 SET @c = @c + 1;
  END

-- Haga un programa que despliegue todas las letras individuales de un nombre de longitud indeterminada y 
-- muestre el código ASCII de cada caracter. Funcion ASCII