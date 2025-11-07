-- ========================================
-- Script: createdb.sql
-- Purpose: Create a sample database and table
-- ========================================

-- 1. Create Database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SampleDB')
BEGIN
    CREATE DATABASE SampleDB;
    PRINT 'Database SampleDB created successfully';
END
ELSE
BEGIN
    PRINT 'Database SampleDB already exists';
END
GO

-- 2. Use the database
USE SampleDB;
GO

-- 3. Create a sample table
IF OBJECT_ID('dbo.Employees', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Employees (
        EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        Email NVARCHAR(100) UNIQUE,
        HireDate DATE DEFAULT GETDATE()
    );
    PRINT 'Table Employees created successfully';
END
ELSE
BEGIN
    PRINT 'Table Employees already exists';
END
GO

-- 4. Insert sample data
INSERT INTO dbo.Employees (FirstName, LastName, Email)
VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');
GO

-- 5. Select data to verify
SELECT * FROM dbo.Employees;
GO