--lenguae de definicion de Datos (SQL-LDD)
--Crear base tienda digital
create database tiendadigital;
go

--cambiar base de datos
use tiendadigital;
go

--crear tabla proveedor
create table proveedor(
proveedorid int not null identity(1,1),
numcontrol varchar(30) not null,
nombreempresa varchar(50) not null,
colonia varchar(50) not null,
numero int,
estado varchar(20) not null,
telefono varchar(20),
paginaweb varchar(30),
constraint pk_proveedor
primary key (proveedorid),
constraint unico_numcontrol
unique(numcontrol),
constraint unico_nombreempresa
unique(nombreempresa),
);
go

--create table categoria
create table categoria(
categoriaid int not null,
descripcion varchar(100) not null
constraint pk_categoria
primary key(categoriaid),
constraint unico_descripcion
unique(descripcion)
);
go

--crear tabla producto
create table producto(
productoid int not null identity(1,1),
numerocontrol varchar(30) not null,
descripcion varchar(100) not null,
precio money not null,
existencia int not null,

categoria int not null,
constraint pk_producto
primary key (productoid)
constraint unico_numerocontrol
unique (numerocontrol),
constraint unico_descripcion_producto
unique (descripcion),
constraint chk_precio
check (precio>0.0),
constraint chk_existencia
--check(existencia between 1 and 2000)
check(existencia>=1 and existencia<2000),
constraint chk_status
--check([status] in(0,1))
check([status] in(0,1))
constraint fk_producto_categoria
foreign key(categoriaid)
references categoria(categoriaid)
);
go
