-- Mirror sunucuda ald���m�z yedek geri y�klenir

RESTORE FILELISTONLY 
FROM DISK = 'C:\DBBackups\WWIMirrorTest_FULL.bak';

RESTORE DATABASE WWIMirrorTest
FROM DISK = 'C:\DBBackups\WWIMirrorTest_FULL.bak'
WITH 
MOVE 'WWIMirrorTest' TO 'C:\DBBackups\WWIMirrorTest.mdf',
MOVE 'WWIMirrorTest_log' TO 'C:\DBBackups\WWIMirrorTest_log.ldf',
NORECOVERY, REPLACE;
