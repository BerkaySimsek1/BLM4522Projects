-- Veri D�n��t�rme � Standartla�t�rma

-- Senaryo:

-- Orders_SourceA tablosunda tarih MM/DD/YYYY, �lke kodu TR, US gibi.

-- Orders_SourceB tablosunda tarih YYYY.MM.DD, �lke ad� tam metin: Turkey, United States.

INSERT INTO Sales.Orders_Standardized (OrderID, OrderDate, CustomerName, Country)
SELECT 
    OrderID,
    CONVERT(DATE, REPLACE(OrderDate, '.', '-'), 120),  -- YYYY-MM-DD format
    CustomerName,
    CountryName
FROM Sales.Orders_SourceB;

-- DAHA �NCE YAPTI�IM ���N G�Z�KM�YOR

