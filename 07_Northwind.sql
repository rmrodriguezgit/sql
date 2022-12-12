-- Ejercicios Northwind
USE Northwind;

SELECT *
FROM Customers;

-- Insertar en Customers la compañía ‘Compañía XX’ con clave 'CXX' ‘Ana Pi’ como contacto
INSERT INTO Customers (CustomerID, CompanyName, ContactName)
VALUES ('CXX','Compañia XX','Ana Pi');
-- Modificar el campo Country 'Mexico' para la compañía CXX 
UPDATE Customers
SET Country='Mexico' 
WHERE CustomerID='CXX';
-- Modificar para la Campañía CXX al Contactname 'Ana Pi' ContactTitle 'Sales Agent'
UPDATE Customers
SET ContactTitle = 'Sales Agent 2' 
WHERE CustomerID='CXX' and ContactName = 'Ana Pi';
-- Borrar el registro cuyo CompanyName 'CXX'
DELETE FROM Customers
WHERE CustomerID = 'CXX';
--
SELECT *
FROM Customers;
--
-- T-SQL
-- SELECT Consultas
-- INSERT Altas
-- UPDATE Actualizaciones
-- DELETE Bajas

UPDATE Customers
SET Country = 'México'
WHERE Country = 'Mexico';

insert into customers (CustomerID,CompanyName, ContactName)
values ('CXX','Compañía XX','Ana Pi');

-- Modificar en Customer el campo ContactTitle
update customers
set ContactTitle='Sin Título'
where Customerid='CXX';

--Eliminar el Customer con ID 'CXX'
delete from customers
where Customerid='CXX';

SELECT *
FROM Suppliers;
--Seleccionar todos los proveedores (suppliers) cuyo trabajo sea ‘Sales Manager’
SELECT *
FROM Suppliers
WHERE ContactTitle = 'Sales Manager';

SELECT * from suppliers where ContactTitle='Sales manager'
-- Seleccionar todos los pedidos de la tabla Orders del OrderDate mes de junio
SELECT *
FROM Orders;

SELECT *
FROM Orders
WHERE month(OrderDate)=6;

--Seleccionar todos los pedidos (orders) de junio
select * from orders
where month(OrderDate)=6

SELECT * from Customers;
--Calcular el número de pedidos por cliente ALFKI
SELECT Count(O.CustomerID) as total 
FROM customers AS C, orders AS O 
WHERE C.CustomerID=O.CustomerID and C.CustomerID='ALFKI';

SELECT Count(*) FROM Orders WHERE CustomerID = 'HANAR';
SELECT * FROM Orders WHERE CustomerID = 'HANAR';

-- SELECT *    SELECT count(*)
SELECT * from Customers;
SELECT count(CustomerID) from Customers;
SELECT * FROM Orders WHERE CustomerID = 'ALFKI'



--Averiguar el producto más caro
SELECT TOP(1) P.ProductID, P.UnitPrice 
FROM Products as P 
order by P.UnitPrice asc ;

SELECT AVG(P.UnitPrice)
FROM Products as P;


