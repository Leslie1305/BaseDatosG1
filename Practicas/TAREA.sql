create database etlempresa

use etlempresa;
 select * from customers

CREATE table cliente(
    clienteid int not null IDENTITY(1,1),
    clientebk nchar(5) not null,
    empresa NVARCHAR(40) not null,
    ciudad NVARCHAR(15) not null,
    region NVARCHAR(15) not null,
    pais NVARCHAR(15) not null, 
    CONSTRAINT pk_cliente
    PRIMARY key(clienteid)
)

CREATE or alter PROCEDURE sp_etl_carga_cliente
AS
BEGIN
    -- Insertar nuevos registros
    INSERT INTO etlempresa.dbo.cliente (clientebk, empresa, ciudad, pais, region)
    SELECT CustomerID,
           UPPER(CompanyName) AS empresa,
           UPPER(City) AS ciudad,
           UPPER(ISNULL(nc.Region, 'SIN REGION')) AS region,
           UPPER(Country) AS pais
    FROM Northwnd.dbo.Customers AS nc
    LEFT JOIN etlempresa.dbo.cliente AS etle ON nc.CustomerID = etle.clientebk
    WHERE etle.clientebk IS NULL;
END

UPDATE cl
SET
    cl.empresa = UPPER(c.CompanyName),
    cl.ciudad = UPPER(c.City),
    cl.pais = UPPER(c.Country),
    cl.region = UPPER(ISNULL(c.Region, 'SIN REGION'))
FROM Northwnd.dbo.Customers AS c
INNER JOIN etlempresa.dbo.cliente AS cl
ON c.CustomerID = cl.clientebk;

EXEC sp_etl_carga_cliente;

select * from Products

create table etlempresa.dbo.Producto (
    ProductoId int not null IDENTITY(1,1),
    Productobk nchar(5) not null,
    NombreProducto nvarchar(50) not null ,
    Categoria nvarchar(50) not null,
    Precio decimal(18, 2) not null,
    Existencia int,
    Descontinuado bit,
	CONSTRAINT pk_Producto
    PRIMARY key(ProductoId)
);


create or alter procedure sp_etl_carga_Producto
as
begin
insert into etlempresa.dbo.Producto (Productobk, NombreProducto, Categoria, Precio, Existencia, Descontinuado)
    SELECT p.ProductID
           UPPER(ProductName) AS NombreProducto,
           UPPER(CategoryID) AS Categoria,
           UnitPrice AS Precio,
           UnitsInStock AS Existencia,
           Discontinued AS Descontinuado
    FROM Northwnd.dbo.Products AS np
    LEFT JOIN etlempresa.dbo.Producto AS ep ON np.ProductID = ep.Productobk
    WHERE ep.Productobk IS NULL;

	UPDATE ep
SET
    ep.NombreProducto = UPPER(p.ProductName),
    ep.Categoria = UPPER(p.CategoryID),
    ep.Precio = np.UnitPrice,
    ep.Existencia = np.UnitsInStock,
    ep.Descontinuado = np.Discontinued
    FROM Northwnd.dbo.Products AS np
INNER JOIN etlempresa.dbo.Producto AS ep
ON np.ProductsID = ep.Productobk;
END;

EXEC sp_etl_carga_Producto;


create table etlempresa.dbo.Empleado (
    EmpleadoID int not null IDENTITY(1,1),
    Empleadobk nvarchar(10),
    NombreCompleto nvarchar(50),
    Ciudad nvarchar(50),
    Region nvarchar(50),
    Pais nvarchar(50)
	CONSTRAINT pk_Empleado
    PRIMARY key(EmpleadoID)
);

create table etlempresa.dbo.Proveedor (
    ProveedorID int primary key,
    ProveedorBK INT,
    Empresa NVARCHAR(50),
    City NVARCHAR(50),
    Region NVARCHAR(50) not null,
    Country NVARCHAR(50) not null,
    HomePage NVARCHAR(MAX),
    Pais NVARCHAR(50)
);