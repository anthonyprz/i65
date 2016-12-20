-----------------------------------------------------------------dar permisos a usersub
--select
use subconsultas
go
grant select on dbo.libros to usersub 
go
grant select on dbo.editoriales to usersub 
--insert 
grant insert on dbo.libros to usersub 
----varios permisos
grant update, delete on dbo.libros to usersub
-----------------------------------------------------------------quitar permisos a usersub
go
revoke select on dbo.editoriales to usersub 
-----------------------------------------------------------------permisos para que ejecuten procedimientos

go 
create proc proc_libros
as 
select * from libros 

grant execute on proc_libros to usersub


grant view definition on proc_libros to usersub