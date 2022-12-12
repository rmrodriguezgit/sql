SET TEXTSIZE 0;  
-- Create variables for the character string and for the current   
-- position in the string.  
DECLARE @position int, @string char(100),  @nombreConcat char(100), @con Char(1)
-- Initialize the current position and the string variables.  
SET @position = 1;  
SET @con=''
SET @string = 'Rubén Miguel Rodríguez Rangel';  
--SET @string = 'Ana Paula Gómez Maldonado' 
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

SELECT CHARINDEX(' ', RTRIM('Ricardo'));

SELECT LEFT('Ricardo Antonio',CHARINDEX(' ', 'Ricardo Antonio')-1);

SELECT RIGHT('Ricardos Antoniol', LEN('Ricardos Antoniol')-CHARINDEX(' ', 'Ricardos Antoniol'));
SELECT SUBSTRING('Ricardos Antoniol',CHARINDEX(' ', 'Ricardos Antoniol')+1,1)


-- Email que detecta 1 o 2 nombres 
DECLARE @nombres char(100), @apa char(100), @numnom int;
SET @nombres = 'Sofia Alessandra';  -- sapecora@actuaria.mx
SET @apa = 'Pecora';
SET @numnom = CHARINDEX(' ', RTRIM(@nombres));
IF @numnom = 0 
  Begin
   PRINT 'Solo tiene un nombre'
   -- PRINT  LEFT(@nombres,CHARINDEX(' ', @nombres)-1) + '@actuaria.mx' 
   PRINT  lower(LEFT(@nombres,1) +RTRIM(@apa) +'@actuaria.mx');
  End
ELSE
  Begin
   PRINT 'Tiene 2 o más nombres'
   PRINT lower(LEFT(@nombres,1) + SUBSTRING(@nombres,CHARINDEX(' ', @nombres)+1,1) 
         +RTRIM(@apa)+ '@actuaria.mx')
  End
