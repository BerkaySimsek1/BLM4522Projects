CREATE LOGIN User_Viewer WITH PASSWORD = 'NewStrongPass123!';
USE WideWorldImporters;
CREATE USER User_Viewer FOR LOGIN User_Viewer;
ALTER ROLE db_datareader ADD MEMBER User_Viewer;
