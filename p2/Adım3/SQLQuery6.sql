-- Veritaban�n� Tek Kullan�c�l� Moda Al
USE master;
GO
ALTER DATABASE WideWorldImporters SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Tam Yede�i Geri Y�kle
USE master;
GO
RESTORE DATABASE WideWorldImporters
FROM DISK = 'C:\DBBackups\WWI_FULL.bak'
WITH REPLACE, NORECOVERY,
MOVE 'WWI_Primary' TO 'C:\DBBackups\WideWorldImporters.mdf',
MOVE 'WWI_UserData' TO 'C:\DBBackups\WideWorldImporters_UserData.ndf',
MOVE 'WWI_Log' TO 'C:\DBBackups\WideWorldImporters_log.ldf',
MOVE 'WWI_InMemory_Data_1' TO 'C:\DBBackups\WideWorldImporters_InMemory_Data_1';



--  Log Yede�ini Geri Y�kle
RESTORE LOG WideWorldImporters
FROM DISK = 'C:\DBBackups\WWI_LOG.trn'
WITH RECOVERY;

-- Veritaban�n� �ok Kullan�c�l� Moda Al

ALTER DATABASE WideWorldImporters SET MULTI_USER;
