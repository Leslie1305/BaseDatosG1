create database repasojoins;

use repasojoins;

create table proveedor(

    provid int not null identity(1,1),
    nombre varchar(50) not null,
    limite_credito money not null,
    constraint pk_proveedor
    primary key (provid)
 );

 create table producto(
    prodid int not null identity(1,1),
    nombre varchar(100) not null, 
    existencia int not null, 
    precio money not null, 
    proveedor int,
    constraint pk_producto 
    primary key(prodid), 
    constraint fk_producto_proveedor
    foreign key(proveedor)
    references proveedor(provid)
 );

 -- Insertar datos en las tablas
 insert into proveedor (nombre, limite_credito)
 values('Proveedor1', 100000),
       ('Proveedor2', 200000),
       ('Proveedor3', 300000),
       ('Proveedor4', 400000),
       ('Proveedor5', 500000);

insert into producto(nombre, existencia, precio, proveedor)
values ('producto1', 34, 45.6, 1),
       ('producto2', 34, 45.6, 1),
       ('producto3', 34, 45.6, 2),
       ('producto4', 34, 45.6, 3);

Select * from proveedor;

Select * from producto;


-- Consultas inner join 

-- Seleccionar todos los productos que tienen proveedor 

select pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.nombre as 'Proveedor'
From proveedor as [p]
inner join 
producto as [pr]
on p.provid = pr.proveedor;

-- Consulta Let Join 

-- Mostrar todos los proveedores y sus respectivos productos 

select pr.prodid ,pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.provid , p.nombre as 'Proveedor'
From proveedor as [p]
left join 
producto as [pr]
on p.provid = pr.proveedor;


update proveedor
set nombre = 'Proveedor6'
where provid = 5;

select * from proveedor

update proveedor
set nombre = 'Proveedor5'
where provid = 5;

insert into proveedor (nombre, limite_credito)
values('Proveedor 6', 45000);

delete from proveedor
where provid =  7;

update proveedor
set nombre='Proveedor6'
where provid = 6;


-- Utilizando rigth join 

select pr.prodid ,pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.provid , p.nombre as 'Proveedor'
From proveedor as [p]
Right join 
producto as [pr]
on p.provid = pr.proveedor;

insert into producto (nombre, precio, existencia, proveedor)
values('producto5', 78.8,22, null);

-- Full Join
select pr.prodid ,pr.nombre as 'Nombre_Producto', pr.precio as [precio], 
pr.existencia as [Existencia], p.provid , p.nombre as 'Proveedor'
From proveedor as [p]
full join 
producto as [pr]
on p.provid = pr.proveedor;

-- Seleccionar todos los proveedores que no tienen asignado productos
select  p.provid as 'Numero de Proveedor' , p.nombre as 'Proveedor'
From proveedor as [p]
left join 
producto as [pr]
on p.provid = pr.proveedor
where pr.prodid is null;

-- Seleccionar todos los productos que no tienen proveedor

select  pr.nombre, pr.precio, pr.Existencia
From proveedor as [p]
right join 
producto as [pr]
on p.provid = pr.proveedor
where p.provid is null