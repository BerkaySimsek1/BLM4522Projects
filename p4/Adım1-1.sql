-- Adým 1: Replikasyon Kurulumu (Snapshot Replication)

EXEC sp_adddistributor @distributor = 'MSSQLSERVER', @password = 'StrongPass123!';
EXEC sp_adddistributiondb @database = 'distribution', @data_folder = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data', 
                          @log_folder = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data';

-- DAHA ÖNCE KURMUÞTUM