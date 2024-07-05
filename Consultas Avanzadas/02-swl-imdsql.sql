use NORTHWND;
--leguaje SQL-LMD

--Selecionar todos los productos
select * from Products

--selecionar todas la categoria de productos
select * from Categories; 

--Slecionar proveedores
select * from Suppliers;

--Sleccionar los cliente
select * from Customers; 

--Sleccionar los empleados
select * from Employees; 

--Sleccionar todas las paqueterias 
select * from Shippers;

--Sleccionar todas las ordenes de compra
select * from Orders;

--Seleccionar todos los dellates de ordenes
select * from [Order Details];

--consultas simples

--Proyeccion

--Alias de tablas
select Products.ProductID AS NumeroProducto, Products.ProductName AS 'Nombre Producto', Products.UnitsInStock AS existencia , Products.UnitPrice AS 'Precio'
from Products; 

 select * from Products as p, Categories as c
 where p.CategoryID = c.CategoryID

--Campo claculado 
--Seleccionar todos los productos mostrando el id del proctucto, el nombre del producto, la existencia, el precio y el importe

select *, (UnitPrice * UnitsInStock) AS 'Importe'from Products; 


select ProductID AS 'Numero Prodcuto', ProductName AS 'Nombre del Procuto', UnitsInStock AS 'Existencia', UnitPrice AS 'Precio', 
(UnitPrice * UnitsInStock) AS 'Importe'from Products; 

--Seleccionar las primeras 10 ordenes
select top 10 * from Orders;

--Seleccionar tdos los clientes ordenados de forma ascendete por el pais 
select customerId AS 'Numero de cliente', companyName AS 'Nombre del Cliente',
 [address] AS 'Direccion', city AS 'Ciudad', country AS 'Pais' from Customers 
 order by country ASC;

 select customerId AS 'Numero de cliente', companyName AS 'Nombre del Cliente',
 [address] AS 'Direccion', city AS 'Ciudad', country AS 'Pais' from Customers 
 order by country ASC;

 select customerId AS 'Numero de cliente', companyName AS 'Nombre del Cliente',
 [address] AS 'Direccion', city AS 'Ciudad', country AS 'Pais' from Customers 
 order by 5 ASC;

 --Seleccionar todos los clientes ordenados por pais de forma descendete 
 select customerId AS 'Numero de cliente', companyName AS 'Nombre del Cliente',
 [address] AS 'Direccion', city AS 'Ciudad', country AS 'Pais' from Customers 
 order by country DESC;

 select customerId AS 'Numero de cliente', companyName AS 'Nombre del Cliente',
 [address] AS 'Direccion', city AS 'Ciudad', country AS 'Pais' from Customers 
 order by country DESC;

 select customerId AS 'Numero de cliente', companyName AS 'Nombre del Cliente',
 [address] AS 'Direccion', city AS 'Ciudad', country AS 'Pais' from Customers 
 order by 5 DESC;

 --Slecciona TODOS LO CLIENTES ORDENADOS DE FORMA ASCENDENTE POR PAIS Y DENTRO DE CADA PAIS ORDENADO POR CIUDAD DE FPRMA DESCENDETE 
 select customerID, CompanyName, country, city from customers order by country, city desc; 

 --Operadores relaciones 
 ----(<,>, <=,>=, ==  o !=)

 --Sleccionar todas los paises a los cuales se les ha enviado las ordenes
 select distinct shipcountry from Orders order by 1

--Sleccionar todas las prdenes enviadas a fracia
select *  from orders where ShipCountry = 'France';

--Sleccionar todas las ordenes realizadas a francia mostrando el numero de orden al que se vendio, 
--empleado que la realizo, el pais al que se envio, la ciudad a la que se envio
select OrderID AS 'Numero de Orden', CustomerID as 'Cliente', EmployeeID as 'Empleado', 
ShipCountry AS 'Pais', ShipCity AS 'Ciudad' from Orders 

--Sleccionar la ordenes en donde no se ha registrado una region de envio
select OrderID AS 'Numero de Orden', CustomerID as 'Cliente', EmployeeID as 'Empleado', 
ShipCountry AS 'Pais', ShipCity AS 'Ciudad', shipRegion from Orders where shipregion is null

--Sleccionar las ordenes en donde se ha registrado una region de envio
select OrderID AS 'Numero de Orden', CustomerID as 'Cliente', EmployeeID as 'Empleado', 
ShipCountry AS 'Pais', ShipCity AS 'Ciudad', shipRegion from Orders where shipregion is not null

--seleccionar los productos con un precio mayor a 50$
select * from Products where UnitPrice >=50

--seleccionar los empleados contratados despues del primero de enero de 1990
select * from Employees where HireDate > '199-01-01'

--seleccioanar los clientes cuyo id sea mayor que 10
select * from customers where Country >= 'Germany'

--mostrar los productos de una cantidad menor o igual a 100
select * from Products where UnitsInStock <= 100

--seleccionar todas las ordenes realizadas antes del 1 de enero
select * from Orders where OrderDate < '1998-01-01'

--Sleccionar todas las ordenes reliazadas por el empleado Fuller
select * from orders where EmployeeID = 2

--Sleccionar todas las ordenes mostrando, mostrando el numero de orden,
--cliente y la fecha dividida en año, mes y dia
select OrderID, CustomerID, OrderDate, YEAR(OrderDate) as 'Año', MONTH(OrderDate) as 'Mes', DAY(OrderDate) AS 'Dia' from Orders 

--Operadores logicos 
--Sleccionar los productos con un precio mayor a 50 y con una cantidad menor o igual a 100
select * from Products where UnitPrice >50 and UnitsInStock <= 100 

--Selecciona todas las ordenes para francia y alemania
select * from Orders where ShipCountry in ('France', 'Germany')

--Selecciona todas las ordenes para francia, alemania y mexico
select * from Orders where ShipCountry ='France'or ShipCountry = 'Germany' or ShipCountry = 'Mexico' 

select * from Orders where ShipCountry in ('France', 'Germany', 'Mexico') 