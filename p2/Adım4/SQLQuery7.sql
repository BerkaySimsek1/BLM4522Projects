-- Tam Yedeði Test Et
RESTORE VERIFYONLY
FROM DISK = 'C:\DBBackups\WWI_FULL.bak';
-- Differential Yedeði Test Et
RESTORE VERIFYONLY
FROM DISK = 'C:\DBBackups\WWI_DIFF.bak';
-- Log Yedeðini Test Et
RESTORE VERIFYONLY
FROM DISK = 'C:\DBBackups\WWI_LOG.trn';
