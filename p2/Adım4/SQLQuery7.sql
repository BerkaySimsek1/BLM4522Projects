-- Tam Yede�i Test Et
RESTORE VERIFYONLY
FROM DISK = 'C:\DBBackups\WWI_FULL.bak';
-- Differential Yede�i Test Et
RESTORE VERIFYONLY
FROM DISK = 'C:\DBBackups\WWI_DIFF.bak';
-- Log Yede�ini Test Et
RESTORE VERIFYONLY
FROM DISK = 'C:\DBBackups\WWI_LOG.trn';
