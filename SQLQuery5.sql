select * from titles;

select title, price, pubdate from titles;


select title "Titulo", 'P.unitario', price 'Precio', pubdate 'fecha de publicacion' from titles;

select * from titles where title_id='PC9999';

select * from titles where titles.type='business';

select * from titles where price > 20;

select * from titles where price is null;


select sales.title_id 'ID', sales.ord_num 'orden de compra', titles.title 'titulo',
	   titles.price 'precio unitario', sales.qty 'cantidad', sales.qty*titles.price 'importe total'
from titles inner join sales on titles.title_id = sales.title_id
where sales.ord_num ='P2121'


select sales.title_id 'ID', sales.ord_num 'orden de compra', titles.title 'titulo',
	   titles.price 'precio unitario', sales.qty 'cantidad', sales.qty*titles.price 'importe total'
from titles , sales 
where sales.ord_num ='P2121' and titles.title_id = sales.title_id


select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and titles.price between 7 and 12

select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and titles.price not between 7 and 12


select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and (titles.type = 'business' or  titles.type ='psychology')


select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and titles.type in ('business' ,'psychology')
--4
select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and titles.type not in ('business' ,'psychology')

select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and titles.title like 'The%'

--6

select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and titles.title like '%computer%'

--7

select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id and (titles.title like '[a-c]%' or titles.title like '_h%' ) 

--8

select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id 

--9
select distinct(titles.title)
from titles , sales
where titles.title_id = sales.title_id 

--10
select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id 
order by titles.type asc,  titles.title asc


select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id 
order by 4 asc,  3 asc


select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id 
order by titles.price asc

--13
select sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,sales.qty, sales.qty*titles.price 'importe total'from sales , titles 
where titles.title_id = sales.title_id 
order by titles.price desc


--14
select top 10 sales.title_id, sales.ord_num, titles.title,titles.type,titles.price,
sales.qty, sales.qty*titles.price 'importe total'from sales , titles
where titles.title_id = sales.title_id 
order by 'importe total' desc

select * from sales











