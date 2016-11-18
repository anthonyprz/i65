

select count(*) from employee
 
 select count(*) from employee
group by job_id
having job_id = 13

select  max(qty) from sales

select max(sales.qty * titles.price) from sales, titles 
where sales.title_id = titles.title_id


--5 

select sum(sales.qty)  from sales

--6
select sum(sales.qty)  from sales
where DATEPART(yyyy,sales.ord_date)=1992

--7

select titles.title_id, titles.title, sum(sales.qty) from titles, sales
where sales.title_id = titles.title_id
group by title,  titles.title_id

--8
select * from sales 
where datepart(yyyy, sales.ord_date)=1994

--9

select titles.title,
sum(sales.qty)
from sales, titles
where  sales.title_id = titles.title_id
and  datepart(yyyy, sales.ord_date)=1994
group by titles.title

--10
select titles.title,
sum(sales.qty)
from sales, titles
where  sales.title_id = titles.title_id
and  datepart(yyyy, sales.ord_date)=1994
group by titles.title
having sum(sales.qty)>100



select * from sales