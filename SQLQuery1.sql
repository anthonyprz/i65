----Activar estadisticas de lectura

--set STATISTICS io on 
--select * from clientes
--set STATISTICS io off

---- estadisticas de tiempo 

--set STATISTICS time on 
--select * from clientes
--set STATISTICS time off

 if OBJECT_ID('libros') is not null
drop table libros 
 if OBJECT_ID('editoriales') is not null
drop table editoriales 


create table editoriales(
codigo tinyint,
nombre varchar(30)
primary key (codigo)
)

create table libros (
codigo int identity,
nombre varchar(30),
autor varchar(30),
codigoEditorial tinyint,
primary key (codigo)
)

insert into editoriales values (1,'ed1')
insert into editoriales values (2,'ed2')
insert into editoriales values (3,'ed3')
insert into editoriales values (4,'ed44444444444')


insert into libros values ('juego de tronos', 'g.rr martin',1)
insert into libros values ('juego del hambre', 'lol',2)
insert into libros values ('caballero errante', 'g.rr martin',3)
insert into libros values ('sin editorial', 'nope',4)

--create table libros (
--codigo tinyint,
--nombre varchar(30),
--codigoEditorial tinyint,
--primary key (codigo),
--foreign key (codigoEditorial) references editoriales (codigo) on update cascade on delete cascade 
--)


select * from editoriales;
select * from libros;

--lol

sp_helpconstraint editoriales;
sp_helpconstraint libros;



delete from libros where codigoEditorial = 3;


 --alter table libros 
 --MODIFY COLUMN codigo tinyint;


ALTER TABLE libros
ADD FOREIGN KEY (codigoEditorial)
REFERENCES editoriales(codigo) on delete cascade on update cascade




update editoriales set codigo = 77 where codigo = 1;


alter table  libros 
nocheck constraint FK__libros__codigoEd__4D94879B

alter table  libros 
check constraint FK__libros__codigoEd__4D94879B



alter table libros
 add precio_min decimal(5,2),
 precio_max decimal(5,2)


 select * from libros
  

  -- añadir restriccion check precios positivos

  alter table libros 
 add constraint CK_preciopositivos
 check  (precio_min>0 and precio_max>0)


   alter table libros 
 add constraint CK_preciominMENORpreciomax
 check  (precio_min <= precio_max)


 alter table libros 
 add constraint CK_autordefault
 default 'autor desconocido'
 for autor;

 SP_HELPCONSTRAINT libros

 insert into libros (nombre, codigoEditorial)values ('loolll',2)



 select * from sys.sysconstraints
 where id=Object_id('libros')

 print object_name(1253579504)



 --ejemplo restriccion UNIQUE
 if object_id('persona') is not null
 drop table persona
 create table persona(
 codigo varchar(6) not null,
 nombre varchar(20) not null,
 direccion varchar(30) not null,
 constraint UQ_persona_nombre unique(codigo, nombre)
 );

 insert into persona 
 values (1,'anthony','azpeitia') 
 insert into persona 
 values (2,'naroa','azpeitia')

 sp_helpconstraint persona;

 insert into persona 
 values (2,'naroa','azpeitia') --error



 if object_id('clientes') is not null
 drop table clientes
 create table clientes(
 Cli_codigo smallint identity primary key,
 Cli_nombre varchar(20)not null,
 Cli_apellidos varchar(30)not null,
 Cli_direccion varchar(40)not null,
 Cli_telefono float(10) not null,
 Cli_dni smallint not null unique
 )

  if object_id('pedidos') is not null
 drop table pedidos
 create table pedidos (
 Ped_codigo smallint primary key,
 Cli_codigo smallint not null,
 foreign key (Cli_codigo) references clientes (Cli_codigo)
 )

 sp_helpconstraint clientes
 sp_helpconstraint pedidos


 create table productos (
 Cod_Pro smallint identity primary key,
 nombre varchar(20)not null,
 precio decimal(5,2) not null
 );

 create table pedidos2(
 Cod_pedido smallint identity primary key,
 fecha_pedido date default getdate(),
 Destinatario varchar(30),
 constraint ch_fechamaxima check (fecha_pedido < getdate())
 );

   if object_id('detalles_pedidos') is not null
 drop table detalles_pedidos
 create table detalles_pedidos(
 Cod_Detalle_Ped smallint identity,
 Cod_pedido smallint,
 Cod_Pro smallint,
 cantidad float(9),
 precio_unidad decimal(5,2),
 foreign key (Cod_pedido) references pedidos2 (Cod_pedido),
 foreign key (Cod_Pro) references productos (Cod_Pro),
 primary key (Cod_Detalle_Ped,Cod_pedido,Cod_Pro)
 )

 sp_helpconstraint productos
 sp_helpconstraint pedidos2
 sp_helpconstraint detalles_pedidos

 insert into productos values ('raton',10.00)
 select* from productos;

 insert into pedidos2 (Destinatario) values ('Anthony perez')
  select* from pedidos2;

  insert into detalles_pedidos values (1,1,5,10.00)
    insert into detalles_pedidos values (2,1,5,10.00) --error
  select* from detalles_pedidos;



  create table clientes2(
  codigo int not null,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int default null,
  primary key (codigo),
  foreign key (referenciadopor) references clientes2 (codigo)
  )

  sp_helpconstraint clientes2
  select * from clientes2

  insert into clientes2 (codigo,nombre,domicilio,ciudad)values (1,'anthony','c/loool','azpe')
   insert into clientes2 (codigo,nombre,domicilio,ciudad,referenciadopor)values (2,'naroa','c/loool','azpe',2)
    insert into clientes2 (codigo,nombre,domicilio,ciudad)values (3,'LOL','c/loool','azpe')
	 insert into clientes2 (codigo,nombre,domicilio,ciudad,referenciadopor)values (4,'XD','c/loool','azpe',2)