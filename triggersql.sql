go
create trigger tr_Empleados_cambios
on EMPLE
for insert, update,delete
as
	begin
	 print 'has efectuado una operacion en la tabla'
	end

	select * from EMPLE

	update EMPLE set apellido = 'Perez' where emp_no = 7521