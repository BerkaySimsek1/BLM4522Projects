USE WideWorldImporters;
GO

-- Gereksiz �ndekslerin Silinmesi
DROP INDEX FK_Sales_Customers_DeliveryCityID ON Sales.Customers;
