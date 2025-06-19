-- Yava� �al��an sorgular� analiz edip optimize ederek daha h�zl� �al��mas�n� sa�lamak.

USE WideWorldImporters;
GO
-- Yava� Sorgu
SELECT c.CustomerName, o.OrderDate, o.ContactPersonID
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2013 AND o.ContactPersonID > 1000;
