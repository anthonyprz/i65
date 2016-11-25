
--------------------------------------------------1
set transaction isolation level read committed
--select * from libros
--where codigo = 2
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


