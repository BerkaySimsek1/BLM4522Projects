-- Publication Olu�tur

USE WideWorldImporters;
EXEC sp_replicationdboption 
    @dbname = N'WideWorldImporters', 
    @optname = N'publish', 
    @value = N'true';
