create database BDAnuncios
go
use BDAnuncios
go

-------------------------------------------------------------------------------categoria
create table categoria(
codigoCategoria int primary key,
categoria varchar(50) not null
)
-------------------------------------------------------------------------------subcategoria
create table subcategoria(
codigoSubCategoria int  primary key,
subcategoria varchar(50) not null,
categoria int not null,
foreign key (categoria) references categoria(codigoCategoria)
)
--alter table subcategoria  ALTER COLUMN categoria int; 
-------------------------------------------------------------------------------localidad
create table localidad(
codigo int  primary key,
nombre varchar(50) not null,
provincia varchar(50) not null
)
-------------------------------------------------------------------------------fotografia
create table fotografia(
codigo int identity primary key,
nombreArchivo varchar(50) not null
)
-------------------------------------------------------------------------------usuario
create table usuario(
codigoUsuario int  primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
email varchar(30) not null,
telefono varchar(10),
estado char(1) not null
)
-------------------------------------------------------------------------------anuncio
create table anuncio(
codigoAnuncio int primary key,
texto varchar(90) not null,
fecha date not null,
precio money not null,
codLocalidad  int,
foreign key (codLocalidad) references localidad(codigo),
codCategoria int,
foreign key (codCategoria) references categoria(codigoCategoria),
codigoSubCategoria int,
foreign key (codigoSubCategoria) references subcategoria(codigoSubCategoria),
codigoUsuario int,
foreign key (codigoUsuario) references usuario(codigoUsuario)
)
ALTER TABLE anuncio 
ADD fotografia int,
foreign key (fotografia) references fotografia(codigo);

-------------------------------------------------------------------------------inserts
insert into usuario values (1,'Anthony','perez','email@email.com',987654321,1)
insert into usuario values (2,'Sergio','perez','email2@email.com',963258741,1)
insert into usuario values (3,'Naroa','Caballero','email3@email.com',741852963,1)
insert into usuario values (4,'Carlos','Ramirez','email4@email.com',123456789,1)
insert into usuario values (5,'Lisa','Santos','email5@email.com',753421869,1)
insert into usuario values (6,'Ruben','Tapia','email6@email.com',986753421,1)
insert into usuario values (7,'Mamen','Moreno','email7@email.com',124357689,1)
insert into usuario values (8,'Ana','Cerqueira','email8@email.com',987123654,0)
insert into usuario values (9,'karina','chuquimarca','email9@email.com',968521473,0)
insert into usuario values (10,'elona','laci','email10@email.com',852136479,2)
insert into usuario values (11,'gorka','dinis','email1@email.com',963547821,2)

insert into localidad values (1,'azpeitia','Guipuzcoa')
insert into localidad values (2,'Donostia','Guipuzcoa')
insert into localidad values (3,'Bilbao','bizkaia')
insert into localidad values (4,'azpeitia','alava')

insert into categoria values (1,'Electrodomesticos')
insert into categoria values (2,'Vehiculos')
insert into categoria values (3,'Limpieza')
insert into categoria values (4,'Servicios')
insert into categoria values (5,'Informatica')

insert into subcategoria values (1,'Domesticos',4)
insert into subcategoria values (2,'Moviles',4)
insert into subcategoria values (3,'transporte',4)
insert into subcategoria values (5,'coches',2)
insert into subcategoria values (6,'motos',2)


--insert into anuncio values (1,'Venta de coches BMW','10/01/2017',80.000,1,2,5,1)
--insert into anuncio values (2,'Venta de motos yamaha','10/01/2017',50.000,2,2,6,2)
insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoUsuario)
					values (3,'el servicio de limpieza','10/01/2017',1000,4,3,6)
insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoUsuario)
					values (4,'la mejor batidora','10/01/2017',150,3,1,8)
insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoUsuario)
					values (5,'lenovo pc','10/01/2017',1500,4,5,3)
insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoUsuario)
					values (6,'microsoft surface','10/01/2017',3000,2,5,4)
--insert into anuncio values (7,'servicio domesticos de limpieza','10/01/2017',60,1,4,1,3)
--insert into anuncio values (8,'servicio de reparacion de moviles','10/01/2017',100,1,4,2,9)
--insert into anuncio values (9,'servicios de buses','10/01/2017',110,1,4,3,11)

insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoSubCategoria,codigoUsuario,fotografia)
 values (10,'lamborghini','10/01/2017',500.00,1,2,5,1,1)
 insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoSubCategoria,codigoUsuario,fotografia)
 values (11,'lamborghini gallardo 2016','10/01/2016',500.00,1,2,5,1,1)
  insert into anuncio (codigoAnuncio,texto,fecha,precio,codLocalidad,codCategoria,codigoSubCategoria,codigoUsuario,fotografia)
 values (12,'audi','10/01/2016',500.00,1,2,5,1,1)

insert into fotografia values ('coche.jpg')
insert into fotografia values ('moto.jpg')

-------------------------------------------------------------------------------selects
select * from usuario
select * from localidad
select * from categoria
select * from subcategoria
select * from anuncio 
select * from fotografia

-------------------------------------------------------------------------------1
select a.*,u.* from anuncio a, usuario u
where fecha < '2017-01-10' and a.codigoUsuario = u.codigoUsuario
-------------------------------------------------------------------------------2
select count(a.codigoAnuncio) 'Numero de anuncios', l.nombre from anuncio a, localidad l where a.codLocalidad = l.codigo
group by l.nombre
-------------------------------------------------------------------------------3
select count(a.codigoAnuncio) 'Numero de anuncios de usuarios bloqueados', l.nombre from anuncio a, localidad l, usuario u 
where a.codLocalidad = l.codigo and a.codigoUsuario = u.codigoUsuario and u.estado = 2
group by l.nombre
-------------------------------------------------------------------------------4
select avg(a.precio) 'media de precios', l.nombre from anuncio a, localidad l where a.codLocalidad = l.codigo
group by l.nombre
-------------------------------------------------------------------------------5
select count(a.codigoAnuncio) 'Numero de anuncios con precio mayor a 100€', l.nombre 
from anuncio a, localidad l 
where a.codLocalidad = l.codigo and a.precio > 100
group by l.nombre
-------------------------------------------------------------------------------6
 select a.codigoAnuncio, a.texto, u.nombre, u.apellido
from anuncio a, usuario u 
where a.codigoUsuario = u.codigoUsuario
-------------------------------------------------------------------------------7
select count(a.codigoAnuncio) 'Numero de anuncios', c.categoria from anuncio a, categoria c 
where a.codCategoria = c.codigoCategoria
group by c.categoria
-------------------------------------------------------------------------------8
select *
from anuncio a
where a.precio between 60 and 120
-------------------------------------------------------------------------------9
select *
from anuncio a
where a.precio >= 180
-------------------------------------------------------------------------------10
select a.texto, a.precio
from anuncio a
where a.precio = (select min(precio) from anuncio)
-------------------------------------------------------------------------------11
update anuncio set texto = 'Cambiado' where codigoAnuncio = 5
-------------------------------------------------------------------------------12
update anuncio set precio = (precio - precio*0.05) 
-------------------------------------------------------------------------------13
update anuncio set precio = (precio - 5) where precio > 120
-------------------------------------------------------------------------------14
update anuncio set precio = (precio - precio*0.2) where precio > (select AVG(precio) from anuncio)
-------------------------------------------------------------------------------15
select *
from anuncio a,localidad l
where a.precio = (select MAX(precio) from anuncio)
	  and a.codLocalidad = l.codigo
	  and l.provincia='Guipuzcoa'


---------------------------------------------------------------------------triggers 1

use BDAnuncios
go
create trigger tr_operaciones
on anuncio
for insert, delete,update
as 
	begin
		if exists(select * from inserted) and 
		   exists(select * from deleted)
		   print 'se ha realizado una actualizacion'
		else
			if exists (select * from inserted)
			print 'se ha realizado una insercion'
		else 
			print 'se ha realizado una borrado'
	end

---------------------------------------------------------------------------triggers 2

create table historicoAnuncios (
codigoAnuncio int,
texto varchar(90),
fecha date,
precio money,
codLocalidad int,
codCategoria int,
codigoSubCategoria int,
codigoUsuario int,
fotografia int
)

go
	create trigger tr_historico
	on anuncio
	for delete
	as 
	begin
	insert into historicoAnuncios  select * from deleted
end
	
--------------------------------------------------------procedimiento 1 
--obtener el usuario que creo el anuncio
go
use BDAnuncios;
go
create procedure obetener_usuario
@codigoAnuncio int
as
begin 
 select u.nombre , u.apellido, u.telefono from anuncio a, usuario u
 where a.codigoUsuario = u.codigoUsuario  and a.codigoAnuncio = @codigoAnuncio
end

--ejecutar 
exec obetener_usuario 2;

	
--------------------------------------------------------procedimiento 2
go
create proc ingresar_usuario
@codigoUsuario int,
@Nombre varchar(30),
@Apellido varchar(30),
@email varchar(30),
@telefono varchar(10),
@estado char(1)
as 
	begin
	 set nocount on 
	 insert into usuario 
		values (@codigoUsuario, @Nombre, @Apellido, @email, @telefono,@estado)
	end
	
	exec ingresar_usuario '12','Nombre','Apellido','email@email',741852963,1

--------------------------------------------------------------------funcion 1
