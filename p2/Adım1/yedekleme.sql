-- Tam Yedek
BACKUP DATABASE WideWorldImporters
TO DISK = 'C:\DBBackups\WWI_FULL.bak'
WITH INIT, NAME = 'Full Backup - WideWorldImporters';

-- Differential Yedek
BACKUP DATABASE WideWorldImporters
TO DISK = 'C:\DBBackups\WWI_DIFF.bak'
WITH DIFFERENTIAL, NAME = 'Differential Backup - WideWorldImporters';


-- LOG yedek
BACKUP LOG WideWorldImporters
TO DISK = 'C:\DBBackups\WWI_LOG.trn'
WITH INIT, NAME = 'Log Backup - WideWorldImporters';
