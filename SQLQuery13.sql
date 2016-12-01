
--------------------------------1
use pubs
declare @date as date 
set @date = GETDATE()	
print @date
--------------------------------2
select [address] from authors

select SUBSTRING([address], 1, 30) AS direccion from authors
--------------------------------3
 select * from sales where DATEPART(YEAR, ord_date) = 1994
--------------------------------4
use pubs
select ord_num,
ord_date,
payterms,
DATEADD(dd, 60 , ord_date),
datepart(qq,dateadd(dd, 60 , ord_date)),
patindex('%60%',payterms) as Patindex
from sales 
where patindex('%60%',payterms) > 0
--------------------------------5
select notes from titles
where DATALENGTH(notes)>=100
--------------------------------6


declare @fecha as char(10)
set @fecha = '2001-10-12'
if ISDATE(@fecha) = 1 print 'es fecha'
else print 'nop, no es fecha'