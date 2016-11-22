use prueba3
--Cantidad de libros de cada editorial
select count(*) 'numero de libros por editorial' from libros
group by libros.editorial


--Cantidad de libros por editorial, pero 
--sólo aquellos grupos cuya cantidad libros sea 
-- mayor que dos

select count(*) 'numero de libros por editorial' from libros
group by libros.editorial
having COUNT(libros.titulo)>2


--Calcular el promedio de los libros agrupados
--por editorial
select libros.editorial, AVG(precio) 'promedio de libros por editorial' from libros
group by libros.editorial





--Calcular el promedio de los libros agrupados
--por editorial pero solamente aquellos grupos
-- cuyo promedio sea mayor a 25
select libros.editorial, AVG(precio) 'promedio de libros por editorial' from libros
group by libros.editorial
having AVG(precio) >25

--Calcular el promedio de los libros agrupados
--por editorial, de aquellas editoriales que 
--tienen más de dos libros

select libros.editorial, AVG(precio) 'promedio de libros por editorial' from libros
group by libros.editorial
having COUNT(libros.titulo)>2


--Calcular el mayor precio de los libros agrupados
--por editorial, de aquellas editoriales que 
--tienen su precio mayor entre 30 y 100

select max(precio) 'mayor precio de libros por editorial' from libros
group by libros.editorial
having max(precio) between 30 and 100

--rollup
select editorial, count(*) 'libros por editorial', grouping(editorial)
 from libros
group by libros.editorial, libros.titulo
with rollup


select 
case  grouping(editorial)
when 1 then 'todo' 
else editorial end as 'editorial',
count(*) 'total de libros'
from libros 
group by libros.editorial
with rollup
