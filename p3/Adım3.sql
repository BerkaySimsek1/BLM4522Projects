--Adým3
--KÖTÜ ÖRNEK
DECLARE @UserInput NVARCHAR(100) = '1 OR 1=1';

EXEC('SELECT * FROM Sales.Orders WHERE CustomerID = ' + @UserInput);

-- GÜVENLÝ SORGU
DECLARE @CustomerID INT = 1;

SELECT * FROM Sales.Orders WHERE CustomerID = @CustomerID;
