--Ad�m3
--K�T� �RNEK
DECLARE @UserInput NVARCHAR(100) = '1 OR 1=1';

EXEC('SELECT * FROM Sales.Orders WHERE CustomerID = ' + @UserInput);

-- G�VENL� SORGU
DECLARE @CustomerID INT = 1;

SELECT * FROM Sales.Orders WHERE CustomerID = @CustomerID;
