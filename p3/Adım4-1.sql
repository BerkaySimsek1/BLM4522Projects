-- Adým 4: Audit Loglarý (Kullanýcý Aktivite Takibi)

-- Server-Level Audit Oluþtur
-- Sunucu düzeyinde login oluþtur
USE WideWorldImporters;
GO

CREATE DATABASE AUDIT SPECIFICATION Audit_Select_Only
FOR SERVER AUDIT Audit_WWI
ADD (SELECT ON DATABASE::WideWorldImporters BY User_DataAnalyst)
WITH (STATE = ON);
GO


-- Bu audit yapýlandýrmasý log dosyalarýný C:\DBBackups\ dizinine yazar.