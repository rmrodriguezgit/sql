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

-- Establece el formato de la base de datos en d�a/mes/a�o
-- La instrucci�n DECLARE permite almacenar una variable
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

-- El mes con n�mero
-- Funci�n a utilizar EOMONTH devuelve el �ltimo d�a del mes
SET DATEFORMAT dmy;
GO
DECLARE @datevar date = '29/02/2020';
SELECT @datevar;
DECLARE @fecha date = EOMONTH(@datevar);
SELECT 'El �ltimo d�a del mes ',month(@fecha),' es ', day(@fecha);
GO

-- Establezca el c�digo para M�xico, Italia, Noruega modificando el ejemplo 1.
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
SELECT 'El �ltimo d�a del mes',DATENAME(mm, @fecha),' es ', day(@fecha);
GO

-- Le�n, Gto., Hoy es Lunes 30 de agosto de 2021
SET LANGUAGE Spanish;  
SET DATEFORMAT dmy;
GO
DECLARE @datevar date = '30/08/2021';
SELECT  @datevar;
SELECT 'Le�n, Gto. , a ' , day(@datevar) , ' de ' ,DATENAME(mm, @datevar),' de ' , year(@datevar)
GO
-- Sofi
SET LANGUAGE Spanish;
SET DATEFORMAT dmy;
GO
DECLARE @fecha date = '26/08/2020';
-- SELECT @datevar;
-- DECLARE @fecha date = @datevar;
SELECT 'Le�n, Gto., a ', day(@fecha), 'de ', DATENAME (mm,@fecha), 'de ',  year(@fecha);
GO

-- Carlos
SET LANGUAGE SPANISH;
SET DATEFORMAT dmy;
GO
DECLARE @fecha date = '26/08/2020';
SELECT 'Le�n, Gto., Hoy es ' , DATENAME(dw,@fecha),day(@fecha), ' de ', 
       DATENAME(mm, @fecha), ' de ', year(@fecha);

-- Le�n, Gto., Hoy es Mi�rcoles 26 de agosto de 2020

-- Muestre el n�mero de d�as vividos hasta el d�a de hoy 
SET DATEFORMAT dmy;
GO
DECLARE @fechanac date = '29/10/1969';
DECLARE @fechahoy date = GETDATE();
SELECT 'Los d�as vividos hasta el d�a de hoy',DATEDIFF(yyyy, @fechanac, @fechahoy);
GO

-- Muestre el n�mero de semanas vividas hasta el d�a de hoy 
-- Muestre la edad de cada uno de nosotros