-- Ad�m 4: Veri Kalitesi Raporlar� � S�reci �l��mleme

-- NULL E-posta Say�s� (Temizlik �ncesi/SONRASI, Temizledi�im i�in �ncesi g�z�kmeyecek)

SELECT COUNT(*) AS NullEmailCount
FROM Application.People
WHERE EmailAddress IS NULL;


-- Toplam Y�klenen Kay�t Say�s�

SELECT COUNT(*) AS TotalOrders
FROM Sales.Orders_Standardized;

-- �lke Baz�nda Da��l�m (D�n��t�rme Sonras� Kontrol)

SELECT Country, COUNT(*) AS OrderCount
FROM Sales.Orders_Standardized
GROUP BY Country
ORDER BY OrderCount DESC;