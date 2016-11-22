create database ejercicio1;
use ejercicio1;

create table EMPLE(
emp_no int primary key,
apellido varchar(30) not null,
oficio varchar(30) not null,
dir int,
fecha_alt date,
salario integer,
comision integer,
dept_no int,
foreign key (dir) references EMPLE(emp_no),
foreign key (dept_no) references DEPART(dept_no)
);

alter table EMPLE add foreign key (dir) references EMPLE(emp_no);

create table DEPART(
dept_no int primary key,
dnombre varchar(30),
loc varchar(50)
)

insert into DEPART values (10,'CONTABILIDAD','SEVILLA')
insert into DEPART values (20,'INVESTIGACIÖN','MADRID')
insert into DEPART values (30,'VENTAS','BARCELONA')
insert into DEPART values (40,'PRODUCCIÓN','BILBAO')


INSERT INTO emple VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);
INSERT INTO emple VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO emple VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO emple VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO emple VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO emple VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO emple VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                       2885,NULL,10);
INSERT INTO emple VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO emple VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO emple VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO emple VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO emple VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO emple VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO emple VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);



-------------------------------------------------------1
select e.apellido, e.oficio, e.dept_no from EMPLE e

select e.apellido, e.oficio, e.dept_no from EMPLE e, DEPART d
where e.dept_no = d.dept_no

-------------------------------------------------------2

select d.dept_no,d.dnombre,d.loc from DEPART d

select d.dept_no,d.dnombre,d.loc from DEPART d, EMPLE e
where e.dept_no = d.dept_no

--3
select * from EMPLE e

--4

select * from EMPLE e
order by e.apellido asc

--5

select * from EMPLE e
order by e.dept_no desc
--6

select * from EMPLE e
order by e.dept_no desc, e.apellido asc

--8
select * from EMPLE e
where e.salario > 2000
--9
select * from EMPLE e
where e.oficio = 'ANALISTA'

--10
select e.apellido, e.oficio from EMPLE e
where e.dept_no = 20

--11

select * from EMPLE e
order by e.apellido asc
--12
select * from EMPLE e
where e.oficio = 'VENDEDOR'
order by e.apellido asc
--13
select * from EMPLE e
where e.oficio = 'ANALISTA' and e.dept_no = 10
order by e.apellido asc
--14
select * from EMPLE e
where e.salario > 2000 or e.dept_no =20
--15
select * from EMPLE e
order by e.oficio asc, e.apellido asc
--16
select * from EMPLE e
where e.apellido like 'A%'
--17
select * from EMPLE e
where e.apellido like '%Z'
--18
select * from EMPLE e
where e.apellido like 'A%' and e.oficio like '%E%'
--19
select * from EMPLE e
where e.salario between 1000 and 2000
--20
select * from EMPLE e
where e.oficio = 'VENDEDOR' and e.comision > 1000
--21
select * from EMPLE e
order by e.dept_no asc, e.apellido asc
--22
select * from EMPLE e
where e.apellido like '%Z' and e.salario>=3000
--23
select * from DEPART d
where d.loc like 'B%'
--24
select * from EMPLE e
where e.oficio = 'EMPLEADO' and e.salario > 1000 and e.dept_no = 10
--25
select * from EMPLE e
where e.comision is null
--26
select * from EMPLE e
where e.comision is null and e.apellido like 'J%'
--27
select * from EMPLE e
where e.oficio in ('VENDEDOR','ANALISTA','EMPLEADO')
--28
select * from EMPLE e
where e.oficio not in ('ANALISTA','EMPLEADO') and e.salario >=2000
--29
select * from EMPLE e
where  e.salario between 2000 and 3000
--30
select e.apellido,e.salario, e.dept_no from EMPLE e
where  e.salario > 2000 and e.dept_no = 10

--31
select e.apellido from EMPLE e
where  e.salario not between 1000 and 2000

select COUNT(*) from EMPLE e
where  e.salario not between 1000 and 2000

--

select e.apellido, d.dnombre, d.loc from EMPLE e, DEPART d
where e.dept_no = d.dept_no and d.loc = 'SEVILLA'

--

select * from EMPLE 
where EMPLE.fecha_alt > '1991-05-23'


--------------------

--32
select count(e.apellido) from EMPLE e, DEPART d
where e.dept_no = d.dept_no and d.dnombre = 'VENTAS'

--33
select avg(e.salario) from EMPLE e, DEPART d
where e.dept_no = d.dept_no and d.dnombre = 'CONTABILIDAD'

--34
select count(e.apellido) from EMPLE e, DEPART d
where e.dept_no = d.dept_no and e.comision is null
--35
select count(e.apellido) from EMPLE e, DEPART d
where e.dept_no = d.dept_no and e.apellido like 'A%'


--36
select e.salario, e.apellido from EMPLE e
where e.salario = (select min(em.salario) from EMPLE em)

--37
select e.salario, e.apellido from EMPLE e
where e.salario = (select max(em.salario) from EMPLE em)

--38
select LOWER(e.apellido) from EMPLE e

--39
select concat(e.apellido ,'/', e.oficio) 'Empleado/oficio' from EMPLE e

--40

select e.apellido, len(e.apellido) from EMPLE e

--40

select year(e.fecha_alt), e.apellido from EMPLE e

--41
select * from EMPLE e
where YEAR(e.fecha_alt)=1992
--42
select * from EMPLE e
where DateName(MONTH, e.fecha_alt)='febrero'
--43
select max(e.salario) from EMPLE e
--44
select * from EMPLE e
where YEAR(e.fecha_alt)=1990 and e.apellido like 'A%'

--45
select * from EMPLE e
where e.dept_no = 10 and e.comision is null