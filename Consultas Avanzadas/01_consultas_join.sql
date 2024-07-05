--Consultas avanzadas
select c.CategoryName AS 'Nombre de la categoria', p.ProductName AS 'Nombre producto',
p.UnitPrice AS 'Precio', p.UnitsInStock AS 'Existencia' 
from Categories AS c inner join Products AS p on c.CategoryID = p.CategoryID where CategoryName in ('Beverages', 'Produce');

 --Sleccionar todas las ordenes que fueron admitidas por los empleados NacnciDocolio. Anne Dodsworth y Andre Fuller

SELECT * FROM Orders
WHERE EmployeeID = 1
or EmployeeID = 9
or EmployeeID = 2;

SELECT * FROM Orders
where EmployeeID in(1,9,2);

--seleccionar todas las ordenes, dividiendo la fecha de orden en año, mes y día
SELECT OrderDate as 'Fecha de Oren',
YEAR(OrderDate) as 'Año',
MONTH (OrderDate) AS 'Mes',
day(OrderDate) as 'Dia'
 FROM  Orders;

--Seleccionar todos los nombres de los empleado s 
select concat(FirstName.''. LastName) as 'Nombre Completo' from Employees;

--Seleccionar todos los productos donde la existencia sea mayor o igual a 40 y el precio sea menor a 19
select ProductName as 'Nombre del Producto', UnitPrice as 'Precio' , UnitsInStock as 'Existencia' from Products where UnitsInStock >= 40 and UnitPrice <19;

--Seleccionar todas las ordenes realizadas de abril a agaost de 1996
select OrderID, CustomerID, EmployeeID, OrderDate from orders where OrderDate >= '1996-04-01' and OrderDate<= '1996-08-31';

select OrderID, CustomerID, EmployeeID, OrderDate from orders where OrderDate between '1996-04-01'and '1996-08-31';

--Seleccionar todas las ordenes entre 1996 y 1998
select * from orders where year(OrderDate) between '1996' and'1998';

--Seleccionar todas las ordenes de 1996 y 1999
select * from orders where year(OrderDate) in ('1996', '1999');

--Seleccionar todos los productos que comiencen con c
select * from Products where ProductName like 'C%';

--Sleccionar tdos lo productos que termines con s
select * from Products where ProductName like '%s'

--Seleccionar todos los producto que el nombre del producto contenga la palabra no
select * from Products where ProductName like '%s'

--Selecionar tosdos los productos que contengan las letras a o n
select * from Products where ProductNamE LIKE '%A%' or ProductName like '%N%'

--Seleccionar todos los productos que comiencen entre la letra a y n
select * from Products where ProductNamE LIKE '[A-N]%';

 --Sleccionar todas las ordenes que fueron admitidas por los empleados NacnciDocolio. Anne Dodsworth y Andre Fuller
select o.OrderID as 'Numero de Origen', o.OrderDate as 'Fecha de Orden', CONCAT(FirstName, '',  LastName) as 'Nombre Empleado' 
from Employees as e inner join orders as o on e.EmployeeID = o.EmployeeID where e.FirstName in ('Nancy', 'Anne', 'Andrew') and e.LastName in('Davolio','Dodsworth','Fuller')

--Crar base de datos 
create database pruebaxyz;
--Utilizar base de datos
use pruebaxyz;

--Crear una tabla a partir de una consukra con cero registros
select top 0 * into pruebaxyz.dbo.products2 from Northwnd.dbo.Products; 

--Agregar un constrint a la tabla products2
SELECT * FROM products2 
alter table products2 add constraint pk_products2 
primary key (productid);


select * from products2;

--llenar una tabla a partir de una consulta

insert into pruebaxyz.dbo.products2 
select * from NORTHWND.dbo.Products;

-- Agrega un constraint a la tabla products2
alter table products2
add constraint pk_products2
primary key(productid);

alter table products2
drop constraint pk_products2


select * from products2

-- llenar una tabla a partir de una consulta

insert into pruebaxyz.dbo.products2 (ProductName, SupplierID,
CategoryID,QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder,
ReorderLevel, Discontinued )
select ProductName, SupplierID,
CategoryID,QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder,
ReorderLevel, Discontinued 
from northwnd.dbo.Products;

-- Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado 
-- del representante de ventas de cada pedido.

-- Nombre cliente (Customers)
-- Nombre del Empleado (Employees)
-- Pedido

use Northwnd;

select o.customerId, o.Employeeid, o.orderid, o.orderdate 
from 
orders as o;

SELECT c.CompanyName as 'Nombre del cliente',
concat(e.FirstName, ',',e.LastName) as 'Nombre del Empleado', 
o.OrderID, o.orderdate, (od.Quantity * od.UnitPrice) as 'Importe'
FROM CUSTOMERS as c
INNER JOIN
Orders as o
ON o.CustomerID = c.customerid
INNER JOIN Employees as e
ON o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] AS od
ON od.OrderID = o.OrderID
-- where year(OrderDate) in ('1996', '1998');
where year(OrderDate) = '1996' or 
year(OrderDate) = '1998';

-- selecionar cuantas ordenes se han realizado en 1996 y 1998

SELECT count(*) as 'Total de Ordenes'
FROM CUSTOMERS as c
INNER JOIN
Orders as o
ON o.CustomerID = c.customerid
INNER JOIN Employees as e
ON o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] AS od
ON od.OrderID = o.OrderID
-- where year(OrderDate) in ('1996', '1998');
where year(OrderDate) = '1996' or 
year(OrderDate) = '1998';

--Ejercicio 2: Mostrar el nombre del producto, 
-- el nombre del proveedor 
-- y el precio unitario de cada producto.

SELECT p.ProductName as 'Nombre de Producto',
s.CompanyName as 'Nombre del Proveedor',
p.UnitPrice as 'Precio Unitario'
From Products as p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID

--Ejercicio 11:  Seleccionar el total de ordenes hechas por cada uno de los proovedores
select s.CompanyName as 'Proveedor', count(*) as 'Total de Ordenes'
from Suppliers as s 
INNER JOIN Products as p 
ON s.SupplierID = P.SupplierID
INNER JOIN [Order Details] as od 
on od.ProductID = p.ProductID 
GROUP BY s.CompanyName;

--Selecionar el total de dinerp que he vemdido por provedor del primer trimestre de 1996
select s.CompanyName as 'Proveedor', sum(od.UnitPrice * od.Quantity) as 'Total de Ventas $'
from Suppliers as s
INNER JOIN Products as p 
ON s.SupplierID = p. SupplierID
INNER JOIN [Order Details] as od 
on od.ProductID = p.ProductID
INNER JOIN Orders as o 
on o.OrderID = od.OrderID
where o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP by s.CompanyName
order by 'Total de Ventas $' desc;

--Ejercicio 13: seleccionar el total de dinero vendido por categoria y dentro de gategoria por producto
select (od.Quantity * od.UnitPrice) as 'Total de Ventas'
from [Order Details] as od
INNER JOIN Products as p 
on od.ProductID = p.ProductID
INNER JOIN Categories as c
on c.CategoryID = p.CategoryID
group by c.CategoryName
order by 2 desc;
--Sleccionar el total de dinero vendido por caterforia y dentro de por producto 