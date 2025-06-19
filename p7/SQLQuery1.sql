-- Yedekleme Raporları – T-SQL ile İzleme

SELECT 
    database_name,
    backup_start_date,
    backup_finish_date,
    backup_size / 1024 / 1024 AS backup_size_MB,
    physical_device_name,
    type AS backup_type
FROM msdb.dbo.backupset bs
INNER JOIN msdb.dbo.backupmediafamily bmf
    ON bs.media_set_id = bmf.media_set_id
WHERE bs.backup_start_date >= DATEADD(DAY, -7, GETDATE())
  AND bs.database_name = 'WideWorldImporters'
ORDER BY backup_start_date DESC;

-- type = D → Full

-- type = I → Differential

-- type = L → Log

-- physical_device_name → .bak veya .trn dosyasının yolu

-- backup_size_MB → MB cinsinden yedek boyutu
