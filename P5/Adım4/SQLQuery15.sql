-- Adým 4: Veri Kalitesi Raporlarý – Süreci Ölçümleme

-- NULL E-posta Sayýsý (Temizlik Öncesi/SONRASI, Temizlediðim için öncesi gözükmeyecek)

SELECT COUNT(*) AS NullEmailCount
FROM Application.People
WHERE EmailAddress IS NULL;


-- Toplam Yüklenen Kayýt Sayýsý

SELECT COUNT(*) AS TotalOrders
FROM Sales.Orders_Standardized;

-- Ülke Bazýnda Daðýlým (Dönüþtürme Sonrasý Kontrol)

SELECT Country, COUNT(*) AS OrderCount
FROM Sales.Orders_Standardized
GROUP BY Country
ORDER BY OrderCount DESC;