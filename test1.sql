-- Create a new database called 'TestDB'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
FROM sys.databases
WHERE name = N'TestDB'
)
CREATE DATABASE TestDB
GO

USE TestDB
GO

-- Create a new table called 'ftUsers' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.ftUsers', 'U') IS NOT NULL
DROP TABLE dbo.ftUsers
GO
-- Create the table in the specified schema
CREATE TABLE dbo.ftUsers
(
    idUser INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    -- primary key column
    sCode UNIQUEIDENTIFIER NOT NULL,
    sName VARCHAR(50) NOT NULL
    -- specify more columns here
);
GO

TRUNCATE TABLE dbo.ftUsers

DECLARE @total INT, @num INT
SET @total = 100000
SET @num = 1

WHILE @num <= @total
BEGIN
    INSERT INTO dbo.ftUsers
        (sCode, sName)
    VALUES
        (NEWID(), CAST(@num as VARCHAR))
    SET @num += 1
END


SELECT cpu_count, hyperthread_ratio
from sys.dm_os_sys_info