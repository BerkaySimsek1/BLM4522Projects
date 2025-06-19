USE WideWorldImporters;
GO

-- Optimize Sorgu
SELECT c.CustomerName, o.OrderDate, o.ContactPersonID
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= '2013-01-01' AND o.OrderDate < '2014-01-01'
  AND o.ContactPersonID > 1000;
