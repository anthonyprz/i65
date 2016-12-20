begin try 
	--bloque 1
	raiserror('no existe el autor1',16,1)
	--bloque 2
	raiserror('no existe el autor1',16,1)
	--bloque 3
	raiserror('no existe el autor1',16,1)
end try
begin catch
	if error_state()=1
		print 'error 1'
	else if error_state()=2
		print 'error 2'
	else if error_state()=3
		print 'error 3'
	else 
		print 'otro errocito'
end catch

------------------------------------------------------------------------------------------------------------1
select * from EMPLE 
use ejercicio1
go
create proc VisualizarEmpleadosPorFecha
@fechaInicio date,
@fechaFin date,
@departId int
as begin
	select e.* from EMPLE e, DEPART d
	where d.dept_no = e.dept_no and 
	e.fecha_alt between  @fechaInicio and @fechaFin and
	e.dept_no = @departId
end

go
exec VisualizarEmpleadosPorFecha '1990-01-01','2000-01-01',10;

------------------------------------------------------------------------------------------------------------2
select * from EMPLE 
go
create proc insertarDATOS
@emp_no int,
@apellido varchar(30),
@oficio varchar(30),
@dir int,
@fecha_alt date,
@salario int,
@comision int,
@dept_no int
as 
begin 
	insert into EMPLE values (@emp_no,@apellido , @oficio,@dir , @fecha_alt,@salario,@comision,@dept_no)
end

exec insertarDATOS 7895, 'suarez','empleado',7902,'20-05-2015',16000,0,20


------------------------------------------------------------------------------------------------------------3
go
create procedure numemp_dept
@numdepar int
as 
begin
	select count(*), dept_no from EMPLE where dept_no = @numdepar group by dept_no
end

exec numemp_dept 30


------------------------------------------------------------------------------------------------------------4
go
create procedure numemp_deptbyNombre
@NombreDepart varchar(30)
as 
begin
	select d.dept_no, d.dnombre, count(e.emp_no) 'Numero de empleados' from EMPLE e, DEPART d
	 where	 e.dept_no = d.dept_no and
			 d.dnombre = @NombreDepart
	group by d.dept_no , d.dnombre

	select d.dept_no, d.dnombre, e.apellido, e.salario from EMPLE e, DEPART d
	 where	 e.dept_no = d.dept_no and
			 d.dnombre = @NombreDepart
	
end

exec numemp_deptbyNombre 'CONTABILIDAD'
exec numemp_deptbyNombre 'INVESTIGACIÖN'
drop proc numemp_deptbyNombre


------------------------------------------------------------------------------------------------------------5
go
create proc salario_oficio
@apellido varchar(30)
as
begin
	select salario,oficio,comision from EMPLE where apellido = @apellido
end

exec salario_oficio 'SUAREZ'


exec salario_oficio 'CEREZO'


------------------------------------------------------------------------------------------------------------6
go
create proc salario_oficio2
@apellido varchar(30)='%'
as
begin
	select salario,oficio,comision from EMPLE where apellido = @apellido
end

exec salario_oficio 'SUAREZ'

exec salario_oficio 'SUAREZ'


------------------------------------------------------------------------------------------------------------7

go
create proc salario_oficiolike
@apellido varchar(30)
as
begin
	select salario,oficio,apellido,DEPART.dnombre from EMPLE, DEPART where EMPLE.dept_no = DEPART.dept_no
																			and apellido like '%'+ @apellido + '%'
end

drop proc salario_oficiolike
exec salario_oficiolike 's'

go
use ejercicio1
exec salario_oficiolike 'e'
