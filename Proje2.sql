-- Adım 1: Tam, Artık ve Fark Yedeklemeleri:
-- Tam Yedekleme: Tüm veritabanının yedeği alınır. MacOS kullanıldığım için Docker'a kaydettim.
BACKUP DATABASE AdventureWorks2022
TO DISK = '/var/opt/mssql/backup/AdventureWorks2022_FULL.bak'
WITH FORMAT, INIT, NAME = 'Full Backup - AdventureWorks2022';
-- Artık Yedekleme:
-- Tam yedeklemeden sonra sadece değişen kısımları alır.
-- Dosyalar daha hızlı ve küçüktür.
BACKUP DATABASE AdventureWorks2022
TO DISK = '/var/opt/mssql/backup/AdventureWorks2022_DIFF.bak'
WITH DIFFERENTIAL, NAME = 'Differential Backup - AdventureWorks2022';
-- Fark Yedekleme:
-- Veritabanı değişikliklerini ve işlemleri kaydeder.
-- Felaket anında saniye saniye kurtarma sağlar
BACKUP LOG AdventureWorks2022
TO DISK = '/var/opt/mssql/backup/AdventureWorks2022_LOG.trn'
WITH INIT, NAME = 'Log Backup - AdventureWorks2022';

-- Adım 2: Zamanlayıcılarla Yedekleme
-- Windowsta SQL Server Agent kullanılır fakat benim işletim sistemim MacOS olduğu için farklı yolla yapacağım.
-- Raporda Yazıyor

-- Adım 3: Felaketten Kurtarma Senaryoları
-- Senaryo: Veri kaybedildi ve tam bir geri yükleme yapmak isteniyor
-- Veritabanı single user mode'a alınır:
USE master;
ALTER DATABASE AdventureWorks2022 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Sonra tam yedek geri yüklenir
RESTORE DATABASE AdventureWorks2022
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022_FULL.bak'
WITH NORECOVERY,
MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks2022.mdf',
MOVE 'AdventureWorks2022_log' TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf';

-- Sonra log yedeği belirli bir zamana kadar uygulanır
RESTORE LOG AdventureWorks2022
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022_LOG.trn'
WITH RECOVERY;

-- Tüm işlemlerin sonunda da çok kullanıcılı moda alınır
ALTER DATABASE AdventureWorks2022 SET MULTI_USER;

-- Adım 4: Test yedekleme senaryoları
-- Eğer hata yoksa valid mesajı alınır.
RESTORE VERIFYONLY
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022_FULL.bak';

RESTORE VERIFYONLY
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022_DIFF.bak';

RESTORE VERIFYONLY
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022_LOG.trn';


