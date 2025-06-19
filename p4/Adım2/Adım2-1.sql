-- Tam yedek
BACKUP DATABASE WWIMirrorTest
TO DISK = 'C:\DBBackups\WWIMirrorTest_FULL.bak'
WITH FORMAT;

-- Log yedeði
BACKUP LOG WWIMirrorTest
TO DISK = 'C:\DBBackups\WWIMirrorTest_LOG.trn';
