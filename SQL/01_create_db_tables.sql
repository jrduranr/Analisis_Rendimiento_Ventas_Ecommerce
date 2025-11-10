----------------------------------------------script para crear la base de datos --------------------------------------------------
CREATE DATABASE PortafolioVentas;
GO
USE PortafolioVentas;
GO

----------------------------------------------script para crear las tablas de la base de datos --------------------------------------------------
CREATE TABLE Fact_Ventas (
    InvoiceNo NVARCHAR(20),
    StockCode NVARCHAR(20),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(18, 2),
    CustomerID INT,
    PRIMARY KEY (InvoiceNo, StockCode) -- Clave compuesta
);

-- 2. Tabla de Dimensiones (Clientes)
CREATE TABLE Dim_Clientes (
    CustomerID INT PRIMARY KEY,
    Country NVARCHAR(50)
);

-- 3. Tabla de Dimensiones (Productos)
CREATE TABLE Dim_Productos (
    StockCode NVARCHAR(20) PRIMARY KEY,
    Description NVARCHAR(255)
);