-- Funciones de DATE & TIME
-- MEX
-- 30/08/21
-- 30/08/2021
-- 30/Ago/2021
-- 30 de Agosto de 2021
--EEUU
-- 08/30/2021

-- 01/05/2021  -  Enero 5 de 2021 EEUU
-- 01/05/2021  -  1 de Mayo de 2021 MEX

-- 2021/08/30

-- Establece el formato de la base de datos en día/mes/año
-- La instrucción DECLARE permite almacenar una variable
-- en el ejemplo es de tipo DATE
-- Imprime la variable con SELECT

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
DECLARE @datevar date = '29/02/2020';
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
SET LANGUAGE Norwegian;  
SET DATEFORMAT mdy;
GO
DECLARE @datevar date = '02/02/2020';
SELECT  @datevar;
DECLARE @fecha date = EOMONTH(@datevar);
SELECT 'El último día del mes',DATENAME(mm, @fecha),' es ', day(@fecha);
GO

-- León, Gto., Hoy es Lunes 30 de agosto de 2021
SET LANGUAGE Spanish;  
SET DATEFORMAT dmy;
GO
DECLARE @datevar date = '30/08/2021';
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