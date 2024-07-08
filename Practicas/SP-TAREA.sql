--Crear un sp que solicite un id de una categoria y devuelva el promedio de los productos
select * from Products
create or alter proc sp_solicitar_promedio_prod
@CategoriaID int
as
begin
    select AVG(UnitPrice) AS 'Promedio precios de los productos'
    from Products
    where CategoryID = @CategoriaID;
END;

EXEC sp_solicitar_promedio_prod @CategoriaID = 2;


--crear un store que reciba 2 fechas y devuelva una lista de empleados (nombre fullname) que fueron contratados dentro de ese rango de fechas (Hired Day)

select *  from Employees

create  or alter proc empleados_contratados
@fecha1 date,
@fecha2 date
as 
begin
select FirstName
    from Employees
    where HireDate BETWEEN @fecha1 AND @fecha2;
END;

EXEC empleados_contratados @fecha1 = '1948-12-08', @fecha2 = '1993-10-17';



--procedimineto almacenado para actualizar los precios de un producto y realizar el cambio
--proceso
--1crear almacenamiento almacenado que se llame actualizar precio producto
--2crear una tabla que se llame cambio de precio(cambio id int identity pk, productoid not null int, precioAnterior money, precioNuevo money, fecha de cambio
--dateday)
--3 debe aseptar 2 parametros elq ue se va a combiar y en nuevo precio
--4el procedimiento debe actualizar el precio del producto products
--5debe insertar un registro en la tabla cambio de precio con los detalles de cambio


create table CambioDePrecio (
    CambioID int identity primary key,
    ProductoID int not null,
    PrecioAnterior money,
    PrecioNuevo money,
    FechaDeCambio DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductoID) REFERENCES Products(ProductID)
);

create or alter proc actualizar_precio_producto
    @ProductID INT,
    @NuevoPrecio MONEY
AS
BEGIN
    DECLARE @PrecioAnterior MONEY;
    
    SELECT @PrecioAnterior = UnitPrice
    FROM Products
    WHERE ProductID = @ProductID;

    UPDATE Products
    SET UnitPrice = @NuevoPrecio
    WHERE ProductID = @ProductID;

    INSERT INTO CambioDePrecio (ProductoID, PrecioAnterior, PrecioNuevo)
    VALUES (@ProductID, @PrecioAnterior, @NuevoPrecio);
END;


EXEC actualizar_precio_producto @ProductID = 1, @NuevoPrecio = 25.00;
