USE WideWorldImporters;
GO

-- Ýndekslerin ne kadar kullanýldýðýný gösterir.
-- user_seeks, user_scans, user_lookups gibi sütunlara bakýlarak kullanýlmayan indeksler belirlenir.

SELECT  
    OBJECT_NAME(i.object_id) AS TableName, 
    i.name AS IndexName, 
    ISNULL(s.user_seeks, 0) AS user_seeks, 
    ISNULL(s.user_scans, 0) AS user_scans, 
    ISNULL(s.user_lookups, 0) AS user_lookups, 
    ISNULL(CONVERT(NVARCHAR, s.last_user_seek, 120), 'N/A') AS last_user_seek 
FROM sys.indexes i 
LEFT JOIN sys.dm_db_index_usage_stats s  
    ON i.object_id = s.object_id AND i.index_id = s.index_id AND s.database_id = DB_ID('WideWorldImporters') 
WHERE OBJECTPROPERTY(i.object_id, 'IsUserTable') = 1 
  AND i.type_desc <> 'HEAP' 
  AND i.is_primary_key = 0 
  AND i.is_unique = 0 
ORDER BY TableName;

