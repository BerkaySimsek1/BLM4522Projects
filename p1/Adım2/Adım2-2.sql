USE WideWorldImporters;
GO

-- Gereksiz Żndekslerin Silinmesi
DROP INDEX FK_Sales_Customers_DeliveryCityID ON Sales.Customers;
