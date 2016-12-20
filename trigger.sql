--con el servido como ambito
create trigger tChquedo
on all server for create_table
as print 'tabla creada correctamente :D'
go

create table tn (i int)

disable trigger tChquedo on all server
--con la BD como ambito

use PRUEBA3 
go
create trigger tBASEDATOS
on database for create_view
as print 'view creada =D'

go
create view vista as 
select * from libros



-----------------------------------------trigger segun consulta
--tabla editoriales
use subconsultas
go
create trigger tr_operaciones
on editoriales
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

	insert into editoriales values ('lol')

	update editoriales set nombre = 'lool' where nombre = 'lol'

	delete editoriales where nombre = 'lool'
	----------------------------------------------------------------------------------resguardo
	
	create table historico (
	idEditorial int,
	nombreEditorial varchar(30)
	)

	go
	create trigger tr_historico
	on editoriales
	for delete
	as 
	begin
	insert into historico  select * from deleted
	end
	
	select * from editoriales
	select * from historico

	insert into editoriales values ('borrar')

	delete editoriales where nombre='borrar'


	------------------------------------------------------------------------------------------
	go
	create trigger tr_message
	on editoriales
	instead of insert
	as
	begin
		print 'meeeeennsajeeee' 
	end
	insert into editoriales values ('wtf?')

		select * from editoriales
		
		drop trigger tr_message2
		go


	create trigger tr_message2
	on editoriales
	instead of insert
	as
	begin
		select * from editoriales
	end
	insert into editoriales values ('wtf?')






	drop trigger p2

	go
	create trigger p1
	on editoriales
	for insert
	as
	begin
		print 'mensaje 1 ' 
	end

	go

	create trigger p2
	on editoriales
	for insert
	as
	begin
		print 'mensaje 2 ' 
	end
	
	