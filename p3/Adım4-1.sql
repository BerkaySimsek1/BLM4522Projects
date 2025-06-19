-- Ad�m 4: Audit Loglar� (Kullan�c� Aktivite Takibi)

-- Server-Level Audit Olu�tur
-- Sunucu d�zeyinde login olu�tur
USE WideWorldImporters;
GO

CREATE DATABASE AUDIT SPECIFICATION Audit_Select_Only
FOR SERVER AUDIT Audit_WWI
ADD (SELECT ON DATABASE::WideWorldImporters BY User_DataAnalyst)
WITH (STATE = ON);
GO


-- Bu audit yap�land�rmas� log dosyalar�n� C:\DBBackups\ dizinine yazar.