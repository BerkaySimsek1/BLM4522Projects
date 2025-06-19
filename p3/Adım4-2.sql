-- Adým 4: Audit Loglarý (Kullanýcý Aktivite Takibi)

-- Database-Level Audit Specification Oluþtur
USE WideWorldImporters;
GO

CREATE DATABASE AUDIT SPECIFICATION Audit_Select_Only
FOR SERVER AUDIT Audit_WWI
ADD (SELECT ON DATABASE::WideWorldImporters BY User_DataAnalyst)
WITH (STATE = ON);
GO



-- Bu örnekte sadece User_DataAnalyst kullanýcýsýnýn SELECT iþlemleri izlenir.

-- Loglarý görüntüleme
SELECT *
FROM sys.fn_get_audit_file('C:\DBBackups\Audit_WWI_*.sqlaudit', NULL, NULL);
