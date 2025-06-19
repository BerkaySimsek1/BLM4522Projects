--Adým2

USE master;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'VeryStrongMasterKey123!';


CREATE CERTIFICATE TDE_Cert
WITH SUBJECT = 'TDE Certificate for WideWorldImporters';


USE WideWorldImporters;
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDE_Cert;


ALTER DATABASE WideWorldImporters SET ENCRYPTION ON;

SELECT name, is_encrypted 
FROM sys.databases 
WHERE name = 'WideWorldImporters';

