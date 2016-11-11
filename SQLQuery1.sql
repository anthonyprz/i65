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


