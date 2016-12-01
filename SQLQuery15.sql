use subconsultas
go
create procedure prueba2
as
begin 
	print 'HOLA' 
	return 7
end

declare @valor as integer
exec @valor = prueba2

 print @valor;







 ---------------------------------------------------------------------------obetener_autor
go
use pubs;
go
create procedure obetener_autor
@au_id varchar(11) 
as
begin 
 select authors.au_lname, authors.au_fname from authors
 where authors.au_id=@au_id
end

--ejecutar 
exec obetener_autor '172-32-1176';

 ---------------------------------------------------------------------------obetener_autor2
go
use pubs;
go
create procedure obetener_autor2
@au_id varchar(11) = '172-32-1176'
as
begin 
 select authors.au_lname, authors.au_fname from authors
 where authors.au_id=@au_id
end

--ejecutar 
exec obetener_autor2 '172-32-1176';

 ---------------------------------------------------------------------------obetener_autor3
 go
 create proc obetener_autor3
 @au_id varchar(11)
 as
	begin
	set nocount on
	begin try
			--comprobar la existencia
			if not exists (select au_fname from authors
							where au_id = @au_id)
				begin
					raiserror('no Existe',16,1)
				end
			else 
				select au_fname, au_lname from authors
					where au_id = @au_id

	end try
	begin catch
				print error_message();
	end catch
	end

	exec obetener_autor3 '172-32-1176';


	exec obetener_autor3 '172-32-1276';

	drop proc obetener_autor3

---------------------------------------------------------------------- 2 ejercicio
go
create procedure NumFilas
@NumAutor int output,
@NumTitles int output
as
	begin
	set @NumAutor = (select  count(*) from authors)
	set @NumTitles = (select  count(*) from titles)
	end

--ejecutar
declare @autores int;
declare @titulos int;
exec NumFilas @autores output, @titulos output
select @autores as 'total autores', @titulos as 'total titulos'

----------------------------------------------------------------------------------------------------------------------
create table paises(
idPais char(3) primary key,
Pais varchar(30)
)
create table Cliente(
idCliente varchar(5) primary key,
NombreCliente varchar(30),
ApellidoCliente varchar(30),
FechaNacimiento date,
idPais char(3),
foreign key (idPais) references paises (idPais) 
)
go
create proc Proc_Insertar_Ciente
@idCliente varchar(5),
@NombreCliente varchar(30),
@ApellidoCliente varchar(30),
@FechaNacimiento date,
@idPais char(3)	
as 
	begin
	 set nocount on 
	 insert into Cliente 
		values (@idCliente, @NombreCliente, @ApellidoCliente, @FechaNacimiento, @idPais)
	end

go
create proc Ejecutar_Ingreso
@idCliente varchar(5),
@NombreCliente varchar(30),
@ApellidoCliente varchar(30),
@FechaNacimiento date,
@idPais char(3)	
as
	begin try
		if not exists(select 1 from Cliente where Cliente.idCliente=@idCliente)
			begin
				if exists(select 1 from paises where paises.idPais=@idPais)
					exec Proc_Insertar_Ciente @idCliente, @NombreCliente, @ApellidoCliente, @FechaNacimiento, @idPais
				else
					raiserror ('el País no existe majo ;)', 16, 1)
			end
		else
			raiserror ('el cliente ya existe LOL', 16, 1)
		
	end try
	begin catch
		print error_message()
	end catch
	
	exec Ejecutar_Ingreso 'ID','Nombre','Apellido','22-12-1992',123


	---------------------------------------------------------------------------------------obetener_autor encriptado
	go
use pubs;
go
create procedure obetener_autorENCRIPTADO
@au_id varchar(11) 
with encryption
as
begin 
 select authors.au_lname, authors.au_fname from authors
 where authors.au_id=@au_id
end

--ejecutar 
exec obetener_autor '172-32-1176';

go
use pubs
go
sp_helptext obetener_autorENCRIPTADO