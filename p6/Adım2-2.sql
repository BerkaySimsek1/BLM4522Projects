-- 2022 SÜRÜMDE ALINAN TAM YEDEK GERÝ YÜKLENÝR

RESTORE DATABASE WideWorldImporters
FROM DISK = 'C:\DBBackups\WWI_Upgrade_FULL.bak'
WITH 
MOVE 'WWI_Primary' TO 'C:\DBBackups\WideWorldImporters.mdf',
MOVE 'WWI_UserData' TO 'C:\DBBackups\WideWorldImporters_UserData.ndf',
MOVE 'WWI_Log' TO 'C:\DBBackups\WideWorldImporters_log.ldf',
MOVE 'WWI_InMemory_Data_1' TO 'C:\DBBackups\WideWorldImporters_InMemory_Data_1',
RECOVERY, REPLACE;

