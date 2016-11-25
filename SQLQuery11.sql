use AdventureWorks2012
go
create schema library
go

create table  library.publishers (
publisherID int primary key,
publisherName varchar (100) not null
)

create table library.books(
bookID int identity primary key,
bookTitle varchar(50),
Bookdescriptions varchar(100),
bookpages int,
bookpublisherId int,
bookdate date,
bookISBK varchar(50),
foreign key (bookpublisherId) references library.publishers(publisherID)
)

--delete from library.publishers where publisherID = 10
--1
begin tran
	insert into library.publishers values (10,'Press Ten')
	insert into library.books values ('Title Ten', 'Book number 10',300,10,GETDATE(),111)
commit tran
--2

begin tran
	insert into library.publishers values (10,'Press Ten')
	 if @@ERROR=0
	begin 
		print 'No hay error publishers'
	end
else
	begin 
		print 'hay error publishers'  
		rollback 
		end
		
	insert into library.books values ('Title Ten', 'Book number 10',300,10,GETDATE(),111)
	 if @@ERROR=0
	begin 
		print 'No hay error books'
	end
else
	begin 
		print 'hay error books' 
		rollback 
		end
		
commit tran

select * from library.books
select * from library.publishers

--3
begin tran
	insert into library.publishers (publisherID, publisherName) values (11,N'Press Eleven')
	insert into library.publishers (publisherID, publisherName) values (12,N'Press Eleven')
commit tran

--4

begin tran 
	print @@TRANCOUNT
	begin tran
	print @@TRANCOUNT
	begin tran
	print @@TRANCOUNT
	commit
	commit
	commit
	print @@TRANCOUNT
	---------------------------------
	begin tran 
	print @@TRANCOUNT
	begin tran
	print @@TRANCOUNT
	begin tran
	print @@TRANCOUNT
	if @@TRANCOUNT >0 rollback
	print @@TRANCOUNT
	
--------------------------------------------
	begin tran	                           
		select @@TRANCOUNT                 
		create table prueba (id int)       
		insert into prueba values (1)      
	save tran p1
	select @@TRANCOUNT
	insert into prueba values (2)
	save tran p2
	select @@TRANCOUNT
	insert into prueba values (3)
	select  * from prueba 
	rollback tran p2
	select  * from prueba 
	rollback tran p1
--------------------------------------------




--5
declare @divisor int, @dividendo int, @resultado int
	set @dividendo=100
	set @divisor=0	 
	begin tran 
		begin try	
			set @resultado=@dividendo/@divisor
			commit
		end try
		begin catch
		 print 'WTF??'
			begin
				if ERROR_NUMBER() = 8134
				print 'EEEERRRROOOOORR'
			end
		end catch
commit

----------------------------------------------------------------------
DBCC useroptions
-- cambiar el nivel de aislamiento
--set transaction isolation level read committed
set transaction isolation level read uncommitted
use subconsultas;
--select * from libros
begin tran
update libros 
set titulo = 'Madre Mia WILLY'
where codigo = 2

rollback tran

select @@TRANCOUNT





------------------------------------------------------1

set transaction isolation level read committed
use AdventureWorks2012
begin tran 
update library.books
set bookTitle = 'Madre mia Willy'
where bookISBK = '111'

rollback tran

select @@TRANCOUNT



------------------------------------------------------2
set transaction isolation level read uncommitted
use AdventureWorks2012
begin tran 
update library.books
set bookTitle = 'Madre mia Willy'
where bookISBK = '111'

rollback tran

select @@TRANCOUNT










use subconsultas


set xact_abort on 
begin try
	begin tran
		insert into libros values ('dos','autor1',20,1);
		delete from editoriales where codigo = 2;
	commit tran
end try 
begin catch
	if xact_state() = -1 rollback--error
	if xact_state() = 1 commit
end catch

select * from editoriales

