USE Northwind;
GO

SELECT *
FROM dbo.Employees AS E;
GO

SELECT E.EmployeeID, E.Title, E.FirstName, E.LastName
FROM dbo.Employees AS E;
GO
-- Este código es incorrecto
SELECT *
FROM E;
GO

SELECT Employees.EmployeeID,Employees.Title,Employees.FirstName,Employees.LastName
FROM Employees;
GO

SELECT *
FROM Orders AS O
WHERE O.OrderID = 10248;
GO

SELECT * 
FROM [Order Details] AS OD
WHERE OD.OrderID = 10248;
GO

SELECT O.OrderID,o.CustomerID,O.EmployeeID,O.ShipCity,
O.ShipPostalCode,
OD.ProductID,OD.Quantity,OD.UnitPrice
FROM Orders as O, [Order Details] AS OD
WHERE O.OrderID = OD.OrderID 
AND O.OrderID=10248;







