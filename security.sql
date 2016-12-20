use subconsultas
go

select * from dbo.libros 
select * from dbo.editoriales 


insert into dbo.libros values ('prueba','anthony',1,30.00)

exec dbo.proc_libros




