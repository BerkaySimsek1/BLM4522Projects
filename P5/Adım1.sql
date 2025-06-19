-- Proje 5: Veri Temizleme ve ETL Süreçleri Tasarýmý

--  Adým 1: Veri Temizleme
USE WideWorldImporters;
GO

UPDATE Application.People
SET EmailAddress = REPLACE(LOWER(FullName), ' ', '.') + '@example.com'
WHERE EmailAddress IS NULL;

-- NULL Email Adreslerini Otomatik Doldur
-- Boþluklarý nokta ile deðiþtirip küçük harfe çeviriyoruz.
