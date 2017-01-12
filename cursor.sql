use AdventureWorks2012
go
--declarar el cursor 
declare MiCursor scroll cursor
for select * from library.books
--abrir el cursor
open MiCursor
--navegar por los registros
fetch next from MiCursor
fetch Prior from MiCursor
fetch last from MiCursor
fetch first from MiCursor

--liberar cursor
deallocate MiCursor
--cerrar
close MiCursor
------------------------------
use AdventureWorks2012
go
--declarar el cursor 
Declare @BookId int, @BookTitle varchar(100)
declare MiCursor2 scroll cursor
for select bookID,bookTitle from library.books
--abrir el cursor

open MiCursor2
--navegar por los registros
Declare @BookId int, @BookTitle varchar(100)
fetch MiCursor2 into @BookId, @BookTitle  
print space(5) + 'BookId' + space(5) + 'Title'
while @@FETCH_STATUS=0
	begin 
		print str(@BookId) + space(5) + @BookTitle
		fetch MiCursor2 into @BookId, @BookTitle  
	end

fetch Prior from MiCursor2
fetch last from MiCursor2
fetch first from MiCursor2

--liberar cursor
deallocate MiCursor2
--cerrar
close MiCursor2