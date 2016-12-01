use pubs
---------------------------------------------------------------------------------------------1
declare @anno as integer
set @anno = 1994
select titles.title,
		sum(sales.qty)
from titles, sales 
where sales.title_id = titles.title_id and DATEPART(YEAR, ord_date) = @anno
group by titles.title


---------------------------------------------------------------------------------------------2

declare @promedio as integer
set @promedio = (select avg(sales.qty) from sales)
select ord_num, sales.qty  from sales where sales.qty > @promedio 

---------------------------------------------------------------------------------------------3

declare @numVent as integer = (
select count(sales.qty) from sales 
where sales.title_id ='PC1035' )
	if @numVent = 0
	print  'no hay ventas'
	else
	print  'numero de ventas ' + CAST(@numVent as varchar(30)) 
	select sales.ord_date, sales.qty, sales.title_id from sales where sales.title_id ='PC1035'
---------------------------------------------------------------------------------------------4
select sales.ord_num, sales.qty,
		case 
			when sales.qty <= 30 then 'pequeñas'
			when sales.qty > 30 and sales.qty <= 50 then 'buenas'
			when sales.qty > 50 then 'excelentes'
		end
from sales

---------------------------------------------------------------------------------------------5

declare @cantidad as integer = (select max(sales.qty)  from sales)
	print 'Máxima cantidad  Vendida: ' + str(@cantidad) 
	print 'onrdenes por cantidad vendida:----------------'
declare @contador as integer = 1
declare @ordenes as integer
WHILE  @contador <= @cantidad
   BEGIN    
      set @ordenes =( select count(*) from  sales where qty = @contador)
	  print  'onrdenes que se vendieron' + str(@contador) + ':' +
										   str(@ordenes)
	set @contador = @contador +1 
   END;





