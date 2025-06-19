USE WideWorldImporters;
GO
-- SQL Server’ýn eksik indeks tavsiyelerini gösterir.
SELECT  
    mid.statement AS TableName, 
    mid.equality_columns, 
    mid.inequality_columns, 
    mid.included_columns, 
    migs.user_seeks, 
    migs.avg_total_user_cost, 
    migs.avg_user_impact 
FROM sys.dm_db_missing_index_details AS mid 
INNER JOIN sys.dm_db_missing_index_groups AS mig 
    ON mid.index_handle = mig.index_handle 
INNER JOIN sys.dm_db_missing_index_group_stats AS migs 
    ON mig.index_group_handle = migs.group_handle 
ORDER BY migs.avg_user_impact DESC;


-- EÐER ÖRNEK OLARAK BÝR ÝNDEKS ÇIKSAYDI ONU EKLEYECEKTÝK