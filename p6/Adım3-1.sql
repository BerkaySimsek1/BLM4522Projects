-- Ad�m 3: Test ve Geri D�n�� Plan�
-- Y�kseltme Sonras� Testler

USE WideWorldImporters;
GO

-- Veri okuma testi
SELECT TOP 5 * FROM Sales.Orders;

-- Veri ekleme testi (�rnek tabloya)
INSERT INTO Application.Countries (
    CountryName, FormalName, LatestRecordedPopulation, 
    Continent, Region, Subregion, LastEditedBy
)
VALUES (
    'Testland', 'Testlandia', 100000,
    'Test Continent', 'Test Region', 'Test Subregion',
    1
);


-- Geri silme
DELETE FROM Application.Countries WHERE CountryName = 'Testland';
