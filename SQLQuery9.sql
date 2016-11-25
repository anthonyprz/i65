select * from EMPLE

--1
select e.emp_no, e.apellido, 
e.fecha_alt
from emple e
where e.fecha_alt = (select min(fecha_alt) from EMPLE)
--2
select e.emp_no, e.apellido, 
e.fecha_alt
from emple e
where e.fecha_alt = (select max(fecha_alt) from EMPLE)
--3
select e.apellido, e.oficio from EMPLE e
where e.oficio = (select oficio from EMPLE where apellido like 'JIMÉNEZ')
--4
select e.oficio, e.oficio, e.salario, e.dept_no from EMPLE e
where e.salario > (select max(salario) from EMPLE where dept_no=30)
--5
select e.apellido, e.oficio from EMPLE e
where e.dept_no = 20
and oficio in (select oficio from EMPLE where 
				dept_no = (select dept_no from DEPART where dnombre='VENTAS'))		
--6
select * from emple where 
salario > (select AVG(salario) from EMPLE where oficio = 'DIRECTOR' )
and oficio <>'PRESIDENTE'

select * from emple where 
salario > (select AVG(salario) from EMPLE where oficio = 'DIRECTOR' )
--7
use ejercicio1
select dept_no, dnombre, loc from DEPART as D
where not exists (select * from EMPLE E where E.dept_no = D.dept_no)