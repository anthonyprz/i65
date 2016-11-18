/* Esta secuencia de instrucciones decodifica la información de la tabla
** sysconstraints para presentar información sobre las restricciones de
** una tabla.
*/

USE mibasexx
GO

SELECT 
    OBJECT_NAME(constid) 'Nombre de la restricción',
    constid 'ID de la restricción',
    CASE (status & 0xF)
        WHEN 1 THEN 'Clave primaria'
        WHEN 2 THEN 'Exclusiva'
        WHEN 3 THEN 'Clave externa'
        WHEN 4 THEN 'Comprobación'
        WHEN 5 THEN 'Predeterminado'
        ELSE 'No definido'
    END 'Tipo de restricción',
    CASE (status & 0x30)
        WHEN 0x10 THEN 'Columna'
        WHEN 0x20 THEN 'Tabla'
        ELSE 'ND'
    END 'Nivel'
FROM sysconstraints
WHERE id=OBJECT_ID('libros')



sp_helptext sysconstraints


 drop table empleado


 create table empleados(
 documento varchar(8) primary key,
 nombre varchar(30),
 fechanacimiento datetime,
 cantidadhijos tinyint,
 seccion varchar(20),
 sueldo decimal(6,2));


   insert into empleados values ('qweqweq2','anthony','22-12-2016', 1, 'Administracion',800.00);

   select * from empleados;

 sp_helpindex empleados;

 alter table  empleados 
nocheck constraint CK_fechaactuallimite

alter table  empleados 
check constraint CK_fechaactuallimite


  SP_HELPCONSTRAINT empleados;

  alter table empleados 
 add constraint CK_sueldoPositivo
 check  (sueldo>0 )

  alter table empleados 
 add constraint CK_fechaactuallimite
  check  (fechanacimiento < GETDATE())

    alter table empleados 
 add constraint CK_seccionpermitida
  check  (seccion in ( 'Sistemas' , 'Administracion' , 'Produccion'))

