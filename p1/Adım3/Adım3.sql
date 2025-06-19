-- Yavaþ çalýþan sorgularý analiz edip optimize ederek daha hýzlý çalýþmasýný saðlamak.

USE WideWorldImporters;
GO
-- Yavaþ Sorgu
SELECT c.CustomerName, o.OrderDate, o.ContactPersonID
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2013 AND o.ContactPersonID > 1000;
