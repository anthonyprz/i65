use AdventureWorks2012
go
create view Library.vw_NewestBooks
as 
select b.bookTitle, b.bookISBK as 'ISBN'  from library.books b
where year(b.bookdate) = year(getdate())


select * from library.books

------------------------------------------------------------------------2
go
alter view Library.vw_NewestBooks
as 
select b.bookTitle, b.bookISBK as 'ISBN', b.bookID  from library.books b
where year(b.bookdate) = year(getdate())
------------------------------------------------------------------------3
USE [AdventureWorks2012]
GO
CREATE SYNONYM [dbo].[Library.syn_Books] FOR [AdventureWorks2012].[Library].[books]
GO
------------------------------------------------------------------------4
USE [AdventureWorks2012]
GO
DROP SYNONYM [dbo].[Library.syn_Books]
GO

------------------------------------------------------------------------5
go
create trigger  TR_TablaCheck 
on Database 
for ALTER_TABLE 
as 
  print 'Tabla Modificada'

alter table Library.Books add PublisherWebSite varchar(255)
------------------------------------------------------------------------6
go
DISABLE TRIGGER [TR_TablaCheck]
ON database

go
drop trigger [TR_TablaCheck] ON database

------------------------------------------------------------------------7
go
create trigger TR_TABLACREADA
on all server for CREATE_TABLE 
as 
  print 'Tabla Creada'

create table prueba(cod int)
create table prueba2(cod int, nombre varchar(12))
drop table prueba2
------------------------------------------------------------------------8
go 
create trigger TR_EvitarBorrar
on Library.Books
for delete
	as
	begin
		rollback
		print 'No se Puede eliminar el registro'
	end

	delete Library.Books where bookID = 11
	select * from Library.Books