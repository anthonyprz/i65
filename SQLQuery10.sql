-- transacciones implicitas
set implicit_transactions on
--desactivar 
set implicit_transactions off

--contador de transacciones
print @@TRANCOUNT
begin tran 
	print @@TRANCOUNT
	begin tran
	print @@TRANCOUNT
	commit
	print @@TRANCOUNT

--crear una transaccion en DB subconsultas
use subconsultas
select * from libros
begin transaction BorrarLibro
with MARK N'Borrando Libro'
go
delete from libros where codigo=2;
go
select * from libros;
go
rollback transaction BorrarLibro;
go
select * from libros;

--controlar errores con SQL SERVER
--1.- con bloques TRY y CATCH
create table empleados(
id int primary key,
nombre varchar(30) not null
)
--introducimos datos con un valor nulo el cual dara un error
begin try
	insert into empleados values (02,null)
	print 'paso por el insert' 
end try
--capturar el error con el catch
begin catch
	
	if ERROR_NUMBER() = 515 
		begin
			print 'no se admiten null' + str(error_number());
	end
end catch
 
 --@@ERROR = 0 si la instruccion se ejecutó con exito
 --@@ERROR = 1 error
 --declarar variables
 declare @divisor int, @dividendo int, @resultado int
 set @dividendo=100
 set @divisor=0
 set @resultado=@dividendo/@divisor -- generra error
 --print 'controlando error'
 if @@ERROR=0
	begin 
		print 'No hay error'
	end
else
	begin 
		print 'hay error'
		end

--tercer ejemplito
--gestion de transacciones con errores
use subconsultas;
select * from libros;
select * from editoriales;

begin tran
	begin try
	insert into libros  values('trs','lol',30,1)
	delete from editoriales where codigo=2;
	end try
	begin catch
		if @@TRANCOUNT>0 rollback tran
		--print 'error'
		select ERROR_LINE(),ERROR_MESSAGE(),ERROR_NUMBER()
	end catch
	if @@TRANCOUNT > 0 commit tran
	select * from libros;

