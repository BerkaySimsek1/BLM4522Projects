-- Ad�m 4: Audit Loglar� (Kullan�c� Aktivite Takibi)

-- Database-Level Audit Specification Olu�tur
USE WideWorldImporters;
GO

CREATE DATABASE AUDIT SPECIFICATION Audit_Select_Only
FOR SERVER AUDIT Audit_WWI
ADD (SELECT ON DATABASE::WideWorldImporters BY User_DataAnalyst)
WITH (STATE = ON);
GO



-- Bu �rnekte sadece User_DataAnalyst kullan�c�s�n�n SELECT i�lemleri izlenir.

-- Loglar� g�r�nt�leme
SELECT *
FROM sys.fn_get_audit_file('C:\DBBackups\Audit_WWI_*.sqlaudit', NULL, NULL);
