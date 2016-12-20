
--------------------------------------------------1
set transaction isolation level read committed
use subconsultas
select * from libros
where codigo = 2

------------
select * from libros with(nolock)
where codigo = 2
------------
use AdventureWorks2012
select * from library.books
where bookISBK = '111'

--------------------------------------------------2
set transaction isolation level read uncommitted
--select * from libros
--where codigo = 2
------------
use AdventureWorks2012
select * from library.books
where bookISBK = '111'

--INTERBLOQUEOS
use subconsultas
begin tran 
update editoriales
set nombre='proceso 2'
where codigo = 2

select @@TRANCOUNT

begin tran 
update libros
set titulo='proceso 4'
where codigo = 2

