-- Veri Dönüþtürme – Standartlaþtýrma

-- Senaryo:

-- Orders_SourceA tablosunda tarih MM/DD/YYYY, ülke kodu TR, US gibi.

-- Orders_SourceB tablosunda tarih YYYY.MM.DD, ülke adý tam metin: Turkey, United States.

INSERT INTO Sales.Orders_Standardized (OrderID, OrderDate, CustomerName, Country)
SELECT 
    OrderID,
    CONVERT(DATE, REPLACE(OrderDate, '.', '-'), 120),  -- YYYY-MM-DD format
    CustomerName,
    CountryName
FROM Sales.Orders_SourceB;

-- DAHA ÖNCE YAPTIÐIM ÝÇÝN GÖZÜKMÜYOR

