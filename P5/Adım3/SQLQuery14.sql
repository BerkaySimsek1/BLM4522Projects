-- Adým 3: Veri Yükleme – MERGE Kullanýmý

-- Ayný OrderID'ye sahip kayýtlar varsa güncelle.

-- Yoksa yeni kayýt olarak ekle.
-- Orders_SourceA için MERGE
MERGE Sales.Orders_Standardized AS TARGET
USING (
    SELECT 
        OrderID,
        CONVERT(DATE, OrderDate, 101) AS OrderDate,
        CustomerName,
        CASE CountryCode
            WHEN 'TR' THEN 'Turkey'
            WHEN 'US' THEN 'United States'
            ELSE CountryCode
        END AS Country
    FROM Sales.Orders_SourceA
) AS SOURCE
ON TARGET.OrderID = SOURCE.OrderID
WHEN MATCHED THEN
    UPDATE SET 
        OrderDate = SOURCE.OrderDate,
        CustomerName = SOURCE.CustomerName,
        Country = SOURCE.Country
WHEN NOT MATCHED THEN
    INSERT (OrderID, OrderDate, CustomerName, Country)
    VALUES (SOURCE.OrderID, SOURCE.OrderDate, SOURCE.CustomerName, SOURCE.Country);

-- Orders_SourceB için MERGE

MERGE Sales.Orders_Standardized AS TARGET
USING (
    SELECT 
        OrderID,
        CONVERT(DATE, REPLACE(OrderDate, '.', '-'), 120) AS OrderDate,
        CustomerName,
        CountryName AS Country
    FROM Sales.Orders_SourceB
) AS SOURCE
ON TARGET.OrderID = SOURCE.OrderID
WHEN MATCHED THEN
    UPDATE SET 
        OrderDate = SOURCE.OrderDate,
        CustomerName = SOURCE.CustomerName,
        Country = SOURCE.Country
WHEN NOT MATCHED THEN
    INSERT (OrderID, OrderDate, CustomerName, Country)
    VALUES (SOURCE.OrderID, SOURCE.OrderDate, SOURCE.CustomerName, SOURCE.Country);


    SELECT * FROM Sales.Orders_Standardized