Create database Pruebatriggers;
Go

Use Pruebatriggers;
Go

 Create table Empleado(
 Idempleado int not null primary key, 
 NombreEmplado varchar(30) not null,
 Apellido1 varchar(15) not null,
 Apellido2 varchar(15) null,
 Salario money not null
 );
 Go

