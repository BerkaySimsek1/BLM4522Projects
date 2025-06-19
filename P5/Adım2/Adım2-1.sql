-- Veri Dönüþtürme – Standartlaþtýrma

-- Senaryo:

-- Orders_SourceA tablosunda tarih MM/DD/YYYY, ülke kodu TR, US gibi.

-- Orders_SourceB tablosunda tarih YYYY.MM.DD, ülke adý tam metin: Turkey, United States.

INSERT INTO Sales.Orders_Standardized (OrderID, OrderDate, CustomerName, Country)
SELECT 
    OrderID,
    CONVERT(DATE, OrderDate, 101),  -- MM/DD/YYYY format
    CustomerName,
    CASE CountryCode
        WHEN 'TR' THEN 'Turkey'
        WHEN 'US' THEN 'United States'
        ELSE CountryCode
    END
FROM Sales.Orders_SourceA;

