-- Adım 1: Erişim Yönetimi
-- MacOS kullandığım için sadece SQL Server Authentication kullanabiliyorum.
-- Login Oluşturalım
CREATE LOGIN User_DataAnalyst WITH PASSWORD = 'Sifre123!';

-- Bu login için veritabanında kullanıcı oluştur
USE AdventureWorks2022;
CREATE USER User_DataAnalyst FOR LOGIN User_DataAnalyst;

-- Sadece okuma izni ver
ALTER ROLE db_datareader ADD MEMBER User_DataAnalyst;
-- Adım 2: Veri Şifreleme
-- Disk üstündeki verileri şifrelemek için TDE (Transparent Data Encryption) kullanacağız.

-- Önce "Master Key" oluşturulur.
USE master;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MasterSifresi123!';

-- Sonrasında bir tane TDE sertifikası oluştururuz.
CREATE CERTIFICATE TDE_Cert
WITH SUBJECT = 'TDE Certificate for AdventureWorks2022';

-- Şifreleme işlemini yapabilmek için anahtar oluştururuz
USE AdventureWorks2022;
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDE_Cert;

-- Son olarak şifrelemeyi aktifleştiririz.
ALTER DATABASE AdventureWorks2022 SET ENCRYPTION ON;

-- Şifreleme kontrol edilir

SELECT name, is_encrypted
FROM sys.databases
WHERE name = 'AdventureWorks2022';

-- Adım 3: SQL Injection Testleri

-- Önce injection açığı oluşturabilecek örnek, sonrasında ise doğru örneği vereceğim
-- Injection açığı oluşturabilecek örnek
DECLARE @sql NVARCHAR(MAX)
SET @sql = 'SELECT * FROM Sales.SalesOrderHeader WHERE CustomerID = ' + @input
EXEC(@sql);



-- Doğru örnek
DECLARE @input INT;
SET @input = 11100; 

DECLARE @CustomerID INT = @input;

SELECT * FROM Sales.SalesOrderHeader
WHERE CustomerID = @CustomerID;

 
-- Parametrik sorgular kullanıldığı için SQL Injection önlenebilir.

-- Adım 4: Audit logları:
-- Önce "Server Audit" oluşturulur.
USE master;
GO

CREATE SERVER AUDIT Audit_AdventureWorks
TO FILE (FILEPATH = '/var/opt/mssql/backup/')
WITH (ON_FAILURE = CONTINUE);
GO

ALTER SERVER AUDIT Audit_AdventureWorks
WITH (STATE = ON);
GO

-- Sonra "Database Audit Specification" oluşturalım

USE AdventureWorks2022;
GO

CREATE DATABASE AUDIT SPECIFICATION Audit_Select_Only
FOR SERVER AUDIT Audit_AdventureWorks
ADD (SELECT ON DATABASE::AdventureWorks2022 BY User_DataAnalyst)
WITH (STATE = ON);
GO


-- Bu işlemlerden sonra oluşturduğumuz kullanıcının yaptığı SELECT işlemleri loglanır.
SELECT * FROM Sales.SalesOrderHeader;

-- Logları görmek için

SELECT *
FROM sys.fn_get_audit_file('/var/opt/mssql/backup/Audit_AdventureWorks_*.sqlaudit', NULL, NULL);





