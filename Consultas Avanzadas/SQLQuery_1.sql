create DATABASE ejercicioexam;

use ejercicioexam;

create table proveedor(
    idprov int not null IDENTITY(1,1),
    nombre varchar(50) not null,
    limite_credito money not null,
    CONSTRAINT pk_proveedor
    PRIMARY key (idprov),
    CONSTRAINT unico_nombre_proveedor
    unique(nombre)
);
create table categoria(
    idcatego int not null,
    nombre varchar(50) not null,
    constraint pk_categoria
    PRIMARY key (idcargo),
    CONSTRAINT unico_nombre
);
create table producto(
    idprod int not null,
    nombre VARCHAR(50) not null, 
    preci monete not null,
    existencia int not null,
    idcatego int 
    constraint pk_producto
    primary KEY(idprod),
    constraint fk_producto_prov
    FOREIGN KEY (proveedor)
    REFERENCES proveedor(idprov),
    constraint fk_producto_categoria
    FOREIGN KEY (idcatego)
    REFERENCES categoria(idcatego)  
);
 INSERT into proveedor (nombre, limite_credito)
 values('coca-cola', 98777),
 ('pecsi', 234567),
 ('Hay me pica', 44566),
 ('Hay me duele', 45677),
 ('Tengo Miedo', 22344);

 INSERT into categoria 
 values(1,'Lacteos'),
 (2,'Linea BLanca'),
 (3, 'Dulces'),
 (4,'Vinos'),
 (5,'Abarrotes');

 select * from proveedor

 insert into producto 
 values(1, 'Mascara', 78.9, 20, 5,5 )
 
 insert into producto(proveedor, existencia, idcargo, precio, idprod, nommbre)
 values(3, 34, 5, 56.7,2,'Manita Rascadora')
 
  insert into producto 
 values(3, 'Tonayan', 1450, 56, 4, 4),
 (4, 'Caramelo', 200, 22, 1, 3),
 (5, 'Terry', 200, 24, 4, 4),

 select * from producto
 select * from categoria
 select * from +