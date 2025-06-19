USE WideWorldImporters;
GO

-- Gereksiz Ýndekslerin Silinmesi
DROP INDEX FK_Sales_Customers_DeliveryCityID ON Sales.Customers;
