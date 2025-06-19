USE WideWorldImporters;
GO
-- SQL Server��n eksik indeks tavsiyelerini g�sterir.
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


-- E�ER �RNEK OLARAK B�R �NDEKS �IKSAYDI ONU EKLEYECEKT�K