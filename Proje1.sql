-- Adım 1: Veritabanı İzleme
SELECT TOP 10
    	qs.total_elapsed_time / qs.execution_count AS AvgElapsedTime,
    	qs.execution_count,
    	qs.total_logical_reads,
    	qs.total_logical_writes,
    	qs.creation_time,
    	SUBSTRING(qt.text, (qs.statement_start_offset/2)+1,
       	 ((CASE qs.statement_end_offset
          	WHEN -1 THEN DATALENGTH(qt.text)
          	ELSE qs.statement_end_offset
          	END - qs.statement_start_offset)/2)+1) AS QueryText
    FROM sys.dm_exec_query_stats qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
    ORDER BY AvgElapsedTime DESC;



-- Adım 2
-- Kullanılmayan Indexler Bulunur
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    ISNULL(s.user_seeks, 0) AS user_seeks,
    ISNULL(s.user_scans, 0) AS user_scans,
    ISNULL(s.user_lookups, 0) AS user_lookups,
    ISNULL(CONVERT(NVARCHAR, s.last_user_seek, 120), 'N/A') AS last_user_seek
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats s 
    ON i.object_id = s.object_id AND i.index_id = s.index_id AND s.database_id = DB_ID('AdventureWorks2022')
WHERE OBJECTPROPERTY(i.object_id, 'IsUserTable') = 1
  AND i.type_desc <> 'HEAP'
  AND i.is_primary_key = 0
  AND i.is_unique = 0
ORDER BY TableName;


-- Çıkan Tabloya Göre Gereksiz Indexler Silinir

DROP INDEX IX_ProductVendor_ProductID ON Purchasing.ProductVendor;
-- Performans Arttıracak Indexler Eklenir. Aşağıdaki sorgu eksik indexler için öneri yapar.

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

-- Çıkan Sonuca göre Ekleme Yapılır.

CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_CustomerID
ON Sales.SalesOrderHeader (CustomerID)
INCLUDE (OrderDate, TotalDue);


-- Adım 3 Sorgu İyileştirme
-- Deneme Yapmak İçin Uzun Süren Sorgu Yazılır.
SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013;


-- Bu örnekte fonksiyon kullanmak yerine tarih aralığı ile filtrelediğimiz için daha verimli çalıştı
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '20130101' AND OrderDate < '20140101';
 
-- Adım 4: Veri Yöneticisi Rolleri
-- Aşağıdaki örnekte bir kullanıcıya sadece SELECT yetkisi verilmiştir.
-- Kullanıcı oluştur
CREATE LOGIN User_Viewer WITH PASSWORD = 'NewStrongPass123!';
USE AdventureWorks2022;
CREATE USER User_Viewer FOR LOGIN User_Viewer;
-- Yetki verme (sadece okuma yetkisi)
ALTER ROLE db_datareader ADD MEMBER User_Viewer;





