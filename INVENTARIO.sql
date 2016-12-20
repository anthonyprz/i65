create database Inventario
go
use Inventario
go

create table productos(
id_Cod int identity primary key,
cod_prod varchar(4) not null,
nombre varchar(50) not null,
existencia int not null
)

create table historial(
fecha date,
cod_producto varchar(4),
descripcion varchar(100),
usuario varchar(100)
)
--drop table historial
 create table ventas (
cod_pro varchar(4),
precio money,
cantidad int
)

insert into productos values('A001','MEMORIA USB 35GB',175)
insert into productos values('A002','DISCO DURO 2TB',15)
insert into productos values('A003','AIRE COMPRIMIDO',250)
insert into productos values('A004','ESPUMA LIMPIADORA',300)
insert into productos values('A005','FUNDA MONITOR',500)
insert into productos values('A006','FUNDA TECLADO',700)
insert into productos values('A007','SILLA ERGONÓMICA',11)
insert into productos values('A008','ALFOMBRILLA PARA SILLA',25)
insert into productos values('A009','LÁMPARA ESCRITORIO',7)
insert into productos values('A010','MONITOR LED 28 PULGADAS',45)
insert into productos values('A011','LIBRERO',20)
------------------------------------------------------insercion
go
create trigger TR_ProductoInsertado
on productos
for insert
as
	begin
	declare @codigoProducto varchar(4)
	select @codigoProducto = cod_prod from inserted
	 insert into historial values(getdate(),@codigoProducto, 'Registro Insertado', SYSTEM_USER)
	end

insert into productos values('A012','LIBRERO',11)

select * from historial	


------------------------------------------------------delete
go
create trigger TR_ProductoBorrado
on productos
for delete
as
	begin
	declare @codigoProducto varchar(4)
	select @codigoProducto = cod_prod from deleted
	 insert into historial values(getdate(),@codigoProducto, 'Registro Borrado', SYSTEM_USER)
	end

insert into productos values('A012','LIBRERO',11)

delete productos where id_Cod = 12

select * from historial	
select * from productos


------------------------------------------------------Actualizado
go
create trigger TR_ProductoActualizado
on productos
for update
as
	begin
	declare @codigoProducto varchar(4)
	select @codigoProducto = cod_prod from deleted
	 insert into historial values(getdate(),@codigoProducto, 'Registro Actualizado', SYSTEM_USER)
	end

insert into productos values('A012','LIBRERO',11)

delete productos where id_Cod = 12

select * from historial	
select * from productos


------------------------------------------------------venta

go
create trigger TR_Ventas
on ventas
for insert 
as
	begin
		declare @cantidad int
		declare @codigoProducto varchar(4)
		select @cantidad = cantidad from inserted
		select @codigoProducto = cod_pro from inserted
		update productos set existencia = (existencia - @cantidad) where cod_prod = @codigoProducto
	end


	select * from productos
	insert into ventas values ('A001',30,2)
	select * from productos
	select * from ventas


------------------------------------------------------
