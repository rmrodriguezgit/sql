USE Northwind;
GO

--1. Seleccionar los clientes que viven en el país de "usa" (Juan Carlos Ayala)
SELECT Clientes.ContactName, Clientes.Country
FROM Customers AS Clientes
WHERE Clientes.Country = 'usa'

--2. Seleccionar los proveedores que viven en la ciudad de "BERLIN" (Daniel Isaac)
SELECT Proveedores.ContactName, Proveedores.City
FROM Suppliers AS Proveedores
WHERE Proveedores.City = 'BERLIN'

--3. Seleccionar los empleados con código 3,5 y 8 (Usar Where IN) (Dánae)
SELECT *
FROM Employees
WHERE EmployeeID IN(3,5,8)

--4. Seleccionar los productos que tienen stock mayor que cero y son del (Mildred)
--proveedor 1,3 y 5
SELECT *
FROM Products
WHERE UnitsInStock > 0 and SupplierID in(1,3,5)

--5. Seleccionar los productos con precio mayor o igual a 20 y menor o igual (Aldo)
--a 90
SELECT Productos.ProductName, Productos.UnitPrice AS Precio
FROM Products AS Productos
WHERE Productos.UnitPrice <= 90 and Productos.UnitPrice >= 20

SELECT *
FROM Products AS Productos
WHERE UnitPrice BETWEEN 20 AND 90

--6. Mostrar las órdenes de compra entre las fechas 01/01/1997 al
--15/07/1997 (Usar Where Beetween)  (Eugenia García)
SELECT column_fechas
Orders table_DD/MM/AAAA
WHERE column_fechas BETWEEN

SET DATEFORMAT dmy
SELECT *
FROM Orders AS Ordenes
WHERE OrderDate BETWEEN '01/01/1997' AND '15/07/1997'


--7. Mostrar las órdenes de compra hechas en el año 1997, que pertenecen
--a los empleados con códigos 1 ,3 ,4 ,8 (Miguel Antonio)
Select *
From Orders
WHERE YEAR (OrderDate) = '1997' and (EmployeeID IN(1, 3, 4, 8))
Order by EmployeeID

--8. Mostrar las ordenes hechas en el año 1996 (Sebastián)
 
SELECT *
FROM Orders
WHERE YEAR (OrderDate) = '1996'

--9. Mostrar las ordenes hechas en el año 1997 ,del mes de abril (Irais)
SELECT *
FROM Orders
WHERE YEAR(OrderDate)='1997' AND MONTH (OrderDate)= '4'

--10.Mostrar las ordenes (OrderDate) hechas el primero de todos los meses, del año 1998 DAY YEAR (Adrián)
SET Dateformat ymd
SELECT Orden.OrderID, Orden.OrderDate
    FROM Orders as Orden
    WHERE Orden.OrderDate >= '1998-01-01'
    AND Orden.OrderDate <= '1998-01-31'
--
SELECT *
FROM Orders
WHERE DAY(OrderDate)='1' AND YEAR(OrderDate)='1998'



--11.Mostrar todos los clientes que no tienen fax (Daniela Estrada)
SELECT Cliente.ContactName
FROM Customers as Cliente
-- LEFT OUTER JOIN Cliente as Fax
--ON Cliente.CustomerID = FaxID
WHERE 

SELECT *
FROM Customers AS Clientes
WHERE Fax IS NULL


--12.Mostrar todos los clientes que tienen fax (Daniela Karina Suárez) ***
SELECT *
From Customers as Clientes
Where fax is not null

SELECT *
FROM Customers AS Clientes
Where Clientes.Fax IS NOT NULL

--13.Mostrar el nombre del producto, el precio, el stock y el nombre de la
--categoría a la que pertenece. (Braulio)
SELECT Productos.ProductName, Productos.UnitPrice, Productos.UnitsInStock, Categorias.CategoryName
FROM Products AS Productos
INNER JOIN Categories AS Categorias
ON Productos.CategoryID = Categorias.CategoryID
GROUP BY Productos.ProductName, Productos.UnitPrice, Productos.UnitsInStock, Categorias.CategoryName

--14.Mostrar el nombre del producto, el precio producto, el código del
--proveedor y el nombre de la compañía proveedora. (Carlos Tristán)

--15.Mostrar el número de orden, el código del producto, el precio, la cantidad
--y el total pagado por producto. (Leslie)
SELECT OrderID, ProductID, UnitPrice, Discount, ((UnitPrice * Quantity)*(1 - Discount)) as [TOTAL]
FROM [Order Details]

-- 16. Mostrar el número de orden, fecha, código del producto, 
-- precio, código del empleado y su nombre completo (Luis Gabriel)
-- corregido
SELECT Orders.OrderID, Orders.OrderDate, [Order Details].ProductID, [Order Details].UnitPrice, 
Employees.EmployeeID, Employees.FirstName, Employees.LastName
FROM [Orders]
JOIN [Order Details]
ON [Orders].OrderID = [Order Details].OrderID
JOIN Employees
ON Employees.EmployeeID = [Orders].EmployeeID;


-- 17. Mostrar los 10 productos con menor stock (Andrea Carolina)
   SELECT TOP 10 UnitsInStock, ProductID, ProductName
   FROM dbo.Products
   ORDER BY UnitsInStock ASC

-- 18. Mostrar los 10 productos con mayor stock (José Francisco)
SELECT TOP 10 ProductName AS Producto, UnitsInStock as Stock
FROM dbo.Products
ORDER BY UnitsInStock DESC

-- 19. Mostrar los productos con menor precio (Juliana)
SELECT TOP 10 UnitPrice, ProductID, ProductName
FROM Products
ORDER BY UnitPrice

-- 20. Mostrar los productos con mayor precio (Mario Humberto)
SELECT TOP 10 Productos.ProductName, Productos.UnitPrice, Productos.ProductID
FROM dbo.Products AS Productos
ORDER BY Productos.UnitPrice DESC

-- 21. Mostrar los 10 productos más baratos (Eli) 
Select TOP 10 Products.ProductName, Products.UnitPrice
From dbo.Products
Order By Products.UnitPrice asc


-- 22. Mostrar los 10 productos más caros (Luis Gerardo)
Select TOP 10 Products.ProductName, Products.UnitPrice                                                                                                  From dbo.Products
Order By Products.UnitPrice desc

-- 23. Seleccionar todos los campos de la tabla clientes, ordenar por compañía (Carlos M)
SELECT *
From Customers AS Clientes
ORDER BY Clientes.CompanyName


-- 24. Seleccionar todos los campos de clientes, cuya compañía empiece con
-- la letra B y pertenezcan a UK, ordenar por nombre la compañía (Rubén )
 SELECT *
 FROM Customers AS Clientes
 WHERE Clientes.CompanyName like 'B%' AND Clientes.Country='UK'
 ORDER BY Clientes.CompanyName ASC


-- 25. Seleccionar todos los campos de productos de las categorias 1, 3, y 5 (Luz Mariela)
SELECT *
FROM Products
WHERE CategoryID IN(1,3,5)
ORDER BY CategoryID

-- 26. Seleccionar los productos cuyos precios unitarios están entre 50 y 200 (Jenny)
SELECT Productos.ProductName, Productos.UnitPrice
FROM dbo.Products as Productos
WHERE Productos.UnitPrice between 50 and 200

-- 27. Visualizar el nombre y el id de la compañía del cliente, fecha, precio unitario (Emilio)
-- y producto de la orden
SELECT Orden.OrderID, Clientes.CompanyName, Orden.CustomerID, Orden.OrderDate, OD.UnitPrice, P.ProductName
FROM Customers as Clientes
JOIN Orders as Orden
ON Clientes.CustomerID = Orden.CustomerID
JOIN [Order Details] as OD
ON Orden.OrderID = OD.OrderID
JOIN Products as P
ON P.ProductID = OD.ProductID

-- 28. Visualizar el nombre de la categoria y el número de productos que hay por cada categoría (Margarita)
SELECT C.CategoryName, COUNT (P.ProductName) as [# Productos en cada categoría]
FROM Categories as C
INNER JOIN Products as P
ON C.CategoryID=P.CategoryID
GROUP BY C.CategoryName


-- 29. Seleccionar los 5 productos más vendidos (Alejandro M)
SELECT TOP 5 Productos.ProductName, UnitsOnOrder
FROM dbo.Products AS Productos
ORDER BY Productos.UnitsOnOrder DESC
-- Corregido
SELECT TOP 10 P.ProductName, SUM(OD.Quantity) as Cant
FROM [Order Details] AS OD
JOIN Products AS P
ON OD.ProductID = P.ProductID
GROUP BY ProductName
ORDER BY Cant DESC

-- 30. Seleccionar los jefes de los empleados (Dani Maldonado)
SELECT Jefe.LastName
FROM employees AS Jefe
INNER JOIN employees AS Empleado
ON Jefe.EmployeeID = Empleado.ReportsTo
GROUP BY Jefe.Lastname

-- 31. Obtener todos los productos cuyo nombre comienzan con M  y tienen un precio comprendido entre 28 y 129 (Miguel Angel)
SELECT ProductName, UnitPrice
FROM dbo.Products
WHERE ProductName LIKE 'M%' AND
UnitPrice BETWEEN 28 AND 129

-- 32. Obtener todos los clientes del País de USA, Francia y UK (Israel)
SELECT Clientes.ContactName, Clientes.Country
FROM Customers AS Clientes
WHERE Clientes.Country = 'usa' OR Clientes.Country = 'france' OR Clientes.Country = 'uk'
-- Otra opción
SELECT Clientes.ContactName, Clientes.Country
FROM Customers AS Clientes
WHERE Clientes.Country IN('usa','france','uk')

Examen de Prueba
--1.Obtener todos los productos descontinuados o con stock cero.
SELECT *
FROM Products AS P
WHERE P.Discontinued=1 OR P.UnitsInStock=0

--2.Obtener todas las ordenes hechas por el empleado King Robert
 SELECT O.OrderID,O.EmployeeID,
 (lastname+' '+FirstName)AS NOMBRE_Y_APELLIDO_DEL_EMPLEADO
 FROM Orders AS O
 INNER JOIN Employees AS E
 ON O.EmployeeID=E.EmployeeID
 WHERE (E.lastname+' '+E.FirstName)='Davolio Nancy'

 SELECT O.OrderID,O.EmployeeID,
 (lastname+' '+FirstName) AS [NOMBRE DEL EMPLEADO]
 FROM Orders AS O
 INNER JOIN Employees AS E
 ON O.EmployeeID=E.EmployeeID
 WHERE E.EmployeeID = 7

--3.Obtener todas las ordenes por el cliente cuya compania es "Que
--delicia"
 SELECT O.OrderID,O.CustomerID ,C.CompanyName
 FROM Orders AS O
 INNER JOIN Customers AS C
 ON O.CustomerID=C.CustomerID
 WHERE O.CustomerID='QUEDE'

--4.Obtener todas las ordenes hechas por el empleado King
--Robert,Davolio Nancy y Fuller Andrew
 SELECT O.OrderID,O.EmployeeID,
 (lastname+' '+FirstName)AS [NOMBRE DEL EMPLEADO]
 FROM Orders AS O
 INNER JOIN Employees AS E
 ON O.EmployeeID=E.EmployeeID
 WHERE (E.lastname+' '+E.FirstName)IN('King Robert','Davolio Nancy','Fuller Andrew')

 SELECT O.OrderID,O.EmployeeID,
 (lastname+' '+FirstName)AS [NOMBRE DEL EMPLEADO]
 FROM Orders AS O
 INNER JOIN Employees AS E
 ON O.EmployeeID=E.EmployeeID
 WHERE E.EmployeeID IN (1,2,7)

--5.Obtener todos los productos(codigo,nombre,precio,stock) de la orden
--10257
 SELECT O.OrderID,OD.ProductID,ProductName,
 OD.UnitPrice,UnitsInStock
 FROM Products AS P
 INNER JOIN [Order Details] AS OD
 ON P.ProductID = OD.ProductID
 INNER JOIN Orders AS O
 ON O.OrderID = OD.OrderID
 WHERE O.OrderID=10257

--6.Obtener todos los productos(codigo,nombre,precio,stock) de las
-- órdenes hechas desde 1997 hasta la fecha de hoy.
SELECT YEAR(O.OrderDate) as [Año],MONTH(O.OrderDate) as [Mes],DAY(O.OrderDate) as [Día],OD.ProductID,ProductName,
 OD.UnitPrice,UnitsInStock
 FROM Products AS P
 INNER JOIN [Order Details] AS OD
 ON P.ProductID=OD.ProductID
 INNER JOIN Orders AS O
 ON O.OrderID=OD.OrderID
 WHERE YEAR(O.OrderDate) BETWEEN 1997 AND 2021

--7.Calcular (Mostrar) los 15 productos mas caros
SELECT TOP 15 *
FROM Products
ORDER BY UnitPrice DESC

--8.Calcular (Mostrar) los 5 productos mas baratos
SELECT TOP 5 *
FROM Products
ORDER BY UnitPrice ASC

--9.Obtener el nombre de todas las categorias y los nombres de sus
--productos,precio y stock.
SELECT CategoryName,ProductName,UnitPrice,UnitsInStock
FROM Categories AS C
INNER JOIN Products AS P
ON C.CategoryID=P.CategoryID
ORDER BY C.CategoryName

--10.Calcular el stock de productos por cada categoria.Mostrar el nombre
--de la categoria y el stock por categoria.
 -- INCOMPLETO
 SELECT C.CategoryName,P.UnitsInStock
 FROM Products AS P
 INNER JOIN Categories AS C
 ON P.CategoryID=C.CategoryID
 -- CORRECTO Mario Humberto (Excelente)
 SELECT C.CategoryName, SUM(P.UnitsInStock) AS [Stock por Categoría]
 FROM Categories AS C
 INNER JOIN Products AS P 
 ON C.CategoryID = P.CategoryID
 GROUP BY C.CategoryName
 -- Leslie (Excelente)
SELECT C.CategoryName, SUM(P.UnitsInStock) as [Total Stock]
FROM Products AS P
JOIN Categories AS C
ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
-- Juan Carlos
SELECT Categories.CategoryName, SUM(Products.UnitsInStock) AS 'stock'
FROM dbo.Products
INNER JOIN dbo.Categories 
ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName

--1.Obtener el Nombre del cliente,Nombre del Proveedor,Nombre del
--empleado y el nombre de los productos que estan en la orden 10794
SELECT 
FROM
INNER JOIN
ON
WHERE
-- Solución Andrea Carolina (+1 Punto Extra Examen de Viernes)
SELECT O.OrderID, C.CompanyName, C.ContactName, E.FirstName,E.LastName, OD.ProductID, P.ProductName
FROM Orders as O
INNER JOIN Customers as C
ON C.CustomerID = O.CustomerID
INNER JOIN Employees as E
ON E.EmployeeID=O.EmployeeID
INNER JOIN [Order Details] as OD
ON O.OrderID = OD.OrderID
INNER JOIN Products as P
ON p.ProductID = OD.ProductID
WHERE O.OrderID =10794
-- Daniel (Visto Bueno)
SELECT O.OrderID, C.CompanyName, C.ContactName, E.FirstName, E.LastName, p.ProductName
FROM Orders AS O
INNER JOIN Customers as C
ON O.CustomerID = C.CustomerID
JOIN Employees AS E
ON O.EmployeeID = E.EmployeeID
JOIN [Order Details] AS OD
ON O.OrderID = OD.OrderID
INNER JOIN Products AS P
ON OD.ProductID = P.ProductID
WHERE O.OrderID = 10794

--[8:23] Leslie Andrea Anguiano Reséndez
SELECT O.OrderID, C.CompanyName, (E.FirstName+' '+E.LastName) as [Employee Name], P.ProductName, S.CompanyName
FROM Orders AS O
INNER JOIN Customers AS C
ON O.CustomerID = C.CustomerID
INNER JOIN Employees AS E
ON O.EmployeeID = E.EmployeeID
INNER JOIN [Order Details] AS OD
ON O.OrderID = OD.OrderID
INNER JOIN Products AS P
ON OD.ProductID = P.ProductID
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
WHERE O.OrderID = '10794'


--2.Mostrar el número de órdenes de cada uno de los clientes por
--año,luego ordenar codigo del cliente y el año.
SELECT
FROM
GROUP BY
ORDER BY
-- Dani Estrada
SELECT Orden.CustomerID, YEAR(OrderDate), Count(*)
FROM Orders AS Orden
GROUP BY Orden.CustomerID, YEAR(OrderDate)
ORDER BY Orden.CustomerID, YEAR(OrderDate)
--3.Contar el numero de ordenes que se han realizado por años y meses
--,luego debe ser ordenado por año y por mes.
SELECT
FROM
GROUP BY
ORDER BY
-- Irais
SELECT YEAR(OrderDate) ,COUNT(*)
FROM Orders
GROUP BY YEAR(OrderDate),MONTH(OrderDate)
ORDER BY YEAR(OrderDate),MONTH(OrderDate)

--4.Seleccionar el nombre de la compañía del cliente,él código de la
--orden de compra,la fecha de la orden de compra, código del
--producto, cantidad pedida del producto,nombre del producto, el
--nombre de la compañía proveedora y la ciudad del proveedor ,usar join
--Irais (+1 Punto Extra)
SELECT C.CompanyName,O.OrderID,Orderdate,P.ProductID,Quantity,ProductName,S.CompanyName,S.City
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID = OD.OrderID
INNER JOIN Products AS P
ON od.ProductID = P.ProductID
INNER JOIN Suppliers AS S
ON S.SupplierID = P.SupplierID
-- 5.Seleccionar el nombre de la compañía del cliente, nombre del
--contacto, el código de la orden de compra, la fecha de la orden de
--compra, el código del producto,cantidad pedida del producto, nombre
--del producto y el nombre de la compañía proveedora, usas
--JOIN.Solamente las compañías proveedoras que comienzan con la
--letra de la A hasta la letra G,además la cantidad pedida del producto
--debe estar entre 23 y 187.
SELECT 
FROM
INNER JOIN
ON
WHERE
--Dani
SELECT C.CompanyName,O.OrderID,Orderdate,P.ProductID,Quantity,ProductName,S.CompanyName,C.ContactName
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID = OD.OrderID
INNER JOIN Products AS P
ON od.ProductID = P.ProductID
INNER JOIN Suppliers AS S
ON S.SupplierID = P.SupplierID
WHERE (S.CompanyName like '[A-G]%') AND (Quantity BETWEEN 23 AND 187)