-- Proje 5: Veri Temizleme ve ETL S�re�leri Tasar�m�

--  Ad�m 1: Veri Temizleme
USE WideWorldImporters;
GO

UPDATE Application.People
SET EmailAddress = REPLACE(LOWER(FullName), ' ', '.') + '@example.com'
WHERE EmailAddress IS NULL;

-- NULL Email Adreslerini Otomatik Doldur
-- Bo�luklar� nokta ile de�i�tirip k���k harfe �eviriyoruz.
