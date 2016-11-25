


create database subconsultas
go
use subconsultas
go
if object_id('libros') is not null
  drop table libros;
go
if object_id('editoriales') is not null
  drop table editoriales;
go
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
go 
 create table libros (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  primary key(codigo),
 constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
 );
go

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

 insert into libros values('Uno','Richard Bach',1);
 insert into libros values('Ilusiones','Richard Bach',1);
 insert into libros values('Aprenda PHP','Mario Molina',4);
 insert into libros values('El aleph','Borges',2);
 insert into libros values('Puente al infinito','Richard Bach',2);
go
select * from libros;
go
select * from editoriales

/* Se desea obtener el título, precio del libro y la 
diferencia entre su precio y el precio máximo */
 

 /* Mostrar el título, autor y precio del libro 
 más caro */



-- Actualizar el precio del libro más caro con el valor 45 


 
 --Eliminar el libro con precio menor
 
  
/* Subconsultas con In/Not In */

/*Visualizar el nombre de las editoriales
que han publicado libros del autor 
Richard Bach */



--Nombre de las editoriales que no tienen ningún libro


/* Facturas, detalles de facturas y clientes */
if object_id('detalles') is not null
  drop table detalles;
 if object_id('facturas') is not null
  drop table facturas;
 if object_id('clientes') is not null
  drop table clientes;
 go
 --creamos las tablas
 create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table facturas(
  numero int not null,
  fecha date,
  codigocliente int not null,
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
   on update cascade
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on update cascade
   on delete cascade,
 );
insert into clientes values('Juan Lopez','Colon 123');
 insert into clientes values('Luis Torres','Sucre 987');
 insert into clientes values('Ana Garcia','Sarmiento 576');

 insert into facturas values(1200,'2007-01-15',1);
 insert into facturas values(1201,'2007-01-15',2);
 insert into facturas values(1202,'2007-01-15',3);
 insert into facturas values(1300,'2007-01-20',1);

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
use subconsultas
 select * from facturas
 select * from detalles;
 select * from clientes

--se quiere obtener una lista de todas las facturas
-- con número factura, fecha, cliente, cantidad de artículos
-- y total sum(precio*cantidad)
  select f.*,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;

  select f.*,
  (select count(d.numeroitem)
    from detalles as d
    where f.numero=d.numerofactura) as cantidad,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;
