--use mibase;

--create database "curso sql";

--use [curso sql]

/* create table  empleados (
EmpleadoId int identity (100, 10) not null ,
Nombre nvarchar(30) not null,
Apellidos nvarchar (30) not null,
FechaNac date
 )*/

-- select * from empleados;
--insert into empleados (Nombre, Apellidos, FechaNac) values ('prueba','pruebaAp','22-12-1993');


--set identity_insert empleados on;

--insert into empleados (EmpleadoId, Nombre, Apellidos, FechaNac) values (100, 'prueba','pruebaAp','22-12-1993');
--insert into empleados (EmpleadoId, Nombre, Apellidos, FechaNac) values (100, 'x','x','22-12-1993');

--alter table empleados add Edad  AS datediff(year, FechaNac ,getdate())
		
--select * from empleados;


--alter table empleados add Direccion nvarchar(50);

/*
alter table empleados
alter column Direccion text;

execute sp_help empleados;

alter table empleados
drop column Direccion;

*/