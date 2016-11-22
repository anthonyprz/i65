--crea la base de datos Visitantes

create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

  insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

--Visualizar el total de visitantes
--agrupado por ciudad usando rollup.
select count(*), visitantes.ciudad from visitantes
group by visitantes.ciudad
with rollup


--Total de visitantes agrupado por ciudad y sexo
--con rollup.

select count(*), visitantes.ciudad , visitantes.sexo from visitantes
group by visitantes.ciudad, visitantes.sexo
with rollup

select count(*), visitantes.ciudad , visitantes.sexo from visitantes
group by visitantes.ciudad, visitantes.sexo
with cube
--Total de visitantes agrupado por ciudad y sexo
--con rollup. Añade la función grouping por cada grupo.

select count(*) 'visitantes * ciudad y sexo', visitantes.ciudad , visitantes.sexo,
case grouping(visitantes.ciudad) when 1 then  'total ciudad' else ciudad end as 'ciudad',
case grouping(visitantes.sexo) when 1 then  'total sexo' else sexo end as'sexo'
from visitantes
group by visitantes.ciudad, visitantes.sexo
with rollup
order by visitantes.ciudad, visitantes.sexo

select CASE GROUPING(ciudad)
		when 1 then 'total'
		else ciudad end as 'ciudad',
		CASE GROUPING(sexo)
		when 1 then 'total'
		else sexo end as 'sexo',count(*) as 'visitantes'
 from visitantes group by ciudad, sexo with cube




 ----------------------

select count(*) 'visitantes * ciudad y sexo', visitantes.ciudad , visitantes.sexo,
grouping(visitantes.ciudad),
grouping(visitantes.sexo)
from visitantes
group by visitantes.ciudad, visitantes.sexo
with rollup
order by visitantes.ciudad, visitantes.sexo





