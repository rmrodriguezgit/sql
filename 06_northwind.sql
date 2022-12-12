Use Northwind;
GO

--1. Realizar un procedimiento almacenado que devuelva los 
-- clientes (Customers) según el país (Country).

SELECT CompanyName,ContactName, Country
FROM Customers
WHERE Country = 'Mexico'
go;
-- 1ra opción
CREATE PROCEDURE pro_Clientes_Pais_Igual
-- Variables
   @Pais VARCHAR(20)
AS
   SELECT CompanyName,ContactName, Country
   FROM Customers
   WHERE Country = @Pais;

-- Ejecución del procedimiento almacenado
EXECUTE pro_Clientes_Pais_Igual 'UK'

-- 2da opción
CREATE PROCEDURE pro_Clientes_Pais_Like_v2
-- Variables
   @Pais VARCHAR(20)
AS
   SELECT CompanyName,ContactName, Country
   FROM Customers
   WHERE Country LIKE @Pais+'%';

EXECUTE pro_Clientes_Pais_Like_v2 'U'

--2. Crear un procedimiento que determine la cantidad de clientes cuyo identificador (o sea el código) 
--  inicia con un determinado carácter.

SELECT count(*)
FROM Customers
WHERE CustomerID LIKE 'B'+'%'

-- 1ra opción (usando un parámetro de salida)
CREATE PROCEDURE pro_Cantidad_Clientes
-- Variables
   @ID varchar(10),
   @Cantidad int output
AS
  SELECT @Cantidad = count(*)
  FROM Customers
  WHERE CustomerID LIKE @ID+'%';
-- Llamada para ejecutar
DECLARE @cc int
EXEC pro_Cantidad_Clientes 'A', @cc output
SELECT @cc as Cantidad

-- 2da opción  (usando una variable de retorno)
CREATE PROCEDURE pro_Cantidad_Cliente_op2a
@ID varchar(10)
AS
   DECLARE @Cantidad int
   SELECT @Cantidad = count(*)
    FROM Customers
    WHERE CustomerID LIKE @ID+'%';
   RETURN @Cantidad
-- Llamada
DECLARE @cc int
EXEC @cc = pro_Cantidad_Cliente_op2a 'A'
SELECT @cc as Cantidad

--3. Realizar un procedimiento que determine la cantidad de 
-- registros que un cliente está en la tabla ORDERS. (ALFKI)

SELECT COUNT(*)
FROM Orders
WHERE CustomerID = 'ALFKI'

-- Parámetro de salida (Chicas)
CREATE PROCEDURE PA_CantidadRegistros
--Variables
@ID varchar(10),
@Cantidad int output
AS
SELECT @Cantidad= COUNT (*)
FROM Orders
WHERE CustomerID = @ID;
GO
--Ejecución
DECLARE @C int
EXECUTE PA_CantidadRegistros 'ALFKI', @C output
SELECT @C as [Cantidad]
-- Con valor de retorno (Chicos)
CREATE PROCEDURE pro_Clientes_Frecuentes
-- Variables
@ID VARCHAR(10)
AS
DECLARE @Cantidad int
SELECT @Cantidad = COUNT(*)
FROM Orders
WHERE CustomerID = @ID
RETURN @Cantidad
-- LLAMADA
DECLARE @c int
EXECUTE @c = pro_Clientes_Frecuentes 'ALFKI'
SELECT @c AS Cantidad

--4. Realizar un procedimiento que seleccione todos los registros de tabla 
-- Productos y Categories a la vez.

SELECT *
FROM Products AS P
JOIN Categories AS C
ON P.CategoryID = C.CategoryID

CREATE PROCEDURE pro_Productos_Categorias
AS
SELECT *
FROM Products AS P
JOIN Categories AS C
ON P.CategoryID = C.CategoryID

EXEC pro_Productos_Categorias

--5. Realizar un procedimiento que seleccione todos los productos 
-- que no corresponde a la categoría bebidas (1)
-- Luis Gabriel
SELECT *
FROM Products
WHERE CategoryID <> 1
-- José Fco
SELECT ProductName,CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID= Categories.CategoryID
WHERE CategoryName != 'Beverages'

--
CREATE PROCEDURE pro_Productos_No_Bebidas
AS
SELECT ProductName,CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID= Categories.CategoryID
WHERE CategoryName != 'Beverages'
-- ejecución
EXECUTE pro_Productos_No_Bebidas

--
CREATE PROCEDURE Pro_Productos_Categoria_No_Bebidas
AS
SELECT *
FROM Products
WHERE CategoryID <> 1
--
EXECUTE Pro_Productos_Categoria_No_Bebidas

