use AdventureWorks2012
go
library.udf_GetNumberOfBooks('20030301','20030331')


select b.BookId,b.BookTitle,B.Bookdescriptions,b.BookPages, library.udf_GetNumberOfBooks('20030301', '20030331')
from library.Books b


--------------------------------------------------------------------
use AdventureWorks2012
go
select p.PublisherID,
         StockMessage=
	 case count(b.bookId)
			when 1 then 'hay ' + str(count(b.bookId)) + 'libros'
			
			when 0 then 'no hay libros'
			else  'hay ' +str(count(b.bookId)) + ' libros'

	 end
	 from library.publishers p left join library.Books b
	 on p.PublisherID=b.BookPublisherID
	 group by p.PublisherID


	-----------------------------------------------5
	select b.bookTitle,b.bookdate
	from library.books b
	where b.bookpublisherId in (select PublisherID from library.publishers p
						where p.publisherName like '%ten%')

						select * from library.books
						select * from library.publishers