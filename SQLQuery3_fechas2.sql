USE tienda;
GO

-- Establece el formato de la base de datos en día/mes/año
-- La instrucción DECLARE permite almacenar una variable
-- en el ejemplo es de tipo DATE
-- Imprime la variable con SELECT
​
SET DATEFORMAT dmy;  
GO  
DECLARE @datevar datetime2 = '31/12/2008 09:01:01.1';  
SELECT @datevar;  
GO  

SET DATEFORMAT dmy;
GO
-- Definir/declarar una variable de tipo datetime2 -> fecha
-- Cualquier dato que empieza con @ es nuestra variable
DECLARE @datevar datetime2 = '30/08/2020 10:13:40';
SELECT @datevar;
GO

-- El mes con número
-- Función a utilizar EOMONTH devuelve el último día del mes
SET DATEFORMAT dmy;
GO
DECLARE @datevar date = '17/05/1885';
SELECT @datevar;
DECLARE @fecha date = EOMONTH(@datevar);
SELECT 'El último día del mes ',month(@fecha),' es ', day(@fecha);
GO

-- Establezca el código para México, Italia, Noruega modificando el ejemplo 1.
SET LANGUAGE Italian;  
SET DATEFORMAT mdy;

SET LANGUAGE Spanish;  
SET DATEFORMAT mdy;

SET LANGUAGE Norwegian;  
SET DATEFORMAT mdy;

SET LANGUAGE Italian;  
SET DATEFORMAT dmy;
GO
DECLARE @datevar date = '29/02/2020';
SELECT  @datevar;
DECLARE @fecha date = EOMONTH(@datevar);
SELECT 'El último día del mes',DATENAME(mm, @fecha),' es ', day(@fecha);
GO

-- León, Gto., Hoy es Miércoles 26 de agosto de 2020
SET LANGUAGE Spanish;  
SET DATEFORMAT dmy;
GO
DECLARE @datevar date = '26/08/2020';
SELECT  @datevar;
SELECT 'León, Gto. , a ' , day(@datevar) , ' de ' ,DATENAME(mm, @datevar),' de ' , year(@datevar)
GO
-- Sofi
SET LANGUAGE Spanish;
SET DATEFORMAT dmy;
GO
DECLARE @fecha date = '26/08/2020';
-- SELECT @datevar;
-- DECLARE @fecha date = @datevar;
SELECT 'León, Gto., a ', day(@fecha), 'de ', DATENAME (mm,@fecha), 'de ',  year(@fecha);
GO

-- Carlos
SET LANGUAGE SPANISH;
SET DATEFORMAT dmy;
GO
DECLARE @fecha date = '26/08/2020';
SELECT 'León, Gto., Hoy es ' , DATENAME(dw,@fecha),day(@fecha), ' de ', 
       DATENAME(mm, @fecha), ' de ', year(@fecha);

-- León, Gto., Hoy es Miércoles 26 de agosto de 2020

-- Muestre el número de días vividos hasta el día de hoy 
SET DATEFORMAT dmy;
GO
DECLARE @fechanac date = '29/10/1969';
DECLARE @fechahoy date = GETDATE();
SELECT 'Los días vividos hasta el día de hoy',DATEDIFF(yyyy, @fechanac, @fechahoy);
GO

-- Muestre el número de semanas vividas hasta el día de hoy 
-- Muestre la edad de cada uno de nosotros

-- EJERCICIO
SET LANGUAGE us_english;  
SET DATEFORMAT mdy;  
/* Expression in mdy dateformat */  
SELECT ISDATE('05/18/2020'); --Returns .  1
/* Expression in mdy dateformat */  
SELECT ISDATE('05-18-2020'); --Returns .  1 
/* Expression in mdy dateformat */  
SELECT ISDATE('05.18.2020'); --Returns .  1
/* Expression in myd  dateformat */  
SELECT ISDATE('05/2008/18'); --Returns .  1
​
SET DATEFORMAT mdy;  
SELECT ISDATE('18/05/2020'); --Returns .  0
SET DATEFORMAT mdy;  
SELECT ISDATE('18/2020/05'); --Returns .  0
SET DATEFORMAT mdy;  
SELECT ISDATE('2020/18/05'); --Returns .  0
SET DATEFORMAT mdy;  
SELECT ISDATE('2020/05/18'); --Returns .  1
​
SET DATEFORMAT dmy;  
SELECT ISDATE('18/05/2020'); --Returns .  1
SET DATEFORMAT dym;  
SELECT ISDATE('18/2020/05'); --Returns .  1
SET DATEFORMAT ydm;  
SELECT ISDATE('2020/18/05'); --Returns .  1
SET DATEFORMAT ymd;  
SELECT ISDATE('2020/05/18'); --Returns .  1
​
SET LANGUAGE English;  
SELECT ISDATE('05/18/2020'); --Returns .  1
SET LANGUAGE Spanish;  
SELECT ISDATE('18/2008/09'); --Returns .  1
SET LANGUAGE Swedish;  
SELECT ISDATE('2008/09/18'); --Returns .  1
SET LANGUAGE Italian;  
SELECT ISDATE('2008/15/04'); --Returns .  1
​