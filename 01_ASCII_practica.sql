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


DECLARE @document varchar(64);  
SELECT @document = 'Esta es la clase de Base de Datos' +  
                   ' para el grupo 537 de Actuaria.';  
SELECT CHARINDEX('grupo', @document); 

SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CI_AS); 

SELECT CONCAT ( 'Feliz ', 'Cumpleaños ', 10, '/', '29' ) AS Result; 

-- Returns a DIFFERENCE value of 4, the least possible difference.  
SELECT SOUNDEX('Asia'), SOUNDEX('Hacia'), DIFFERENCE('Asia','Hacia');  
GO  
-- Returns a DIFFERENCE value of 0, the highest possible difference.  
SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  
GO