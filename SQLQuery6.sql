CREATE DATABASE PRUEBA3
GO
USE PRUEBA3
GO
create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 )
 GO
 insert into libros
  values('El aleph','Borges','Planeta',15,null);
 insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
 insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
 insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
 insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
 insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
 insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
 insert into libros
  values('PHP de la A a la Z',null,null,null,0);





  select * from libros

   select count(*) 'cantidad de libros' from libros

  select count( precio ) 'cantidad de libros' from libros


  -- contar por editoriales
  select editorial, count(*) from libros
  group by editorial

  --sumar los precios de los libros por editorial
   select editorial, count(*), sum(precio) 'suma de los precios' 
   from libros
  group by editorial


  select editorial, count(*), max(precio) 'precio mas alto' ,min(precio) 'precio mas bajo' 
   from libros
  group by editorial

    select editorial, count(*), max(precio) 'precio mas alto' ,min(precio) 'precio mas bajo' , AVG(precio)'promedio'
   from libros
  group by editorial

  
    select editorial, count(*), max(precio) 'precio mas alto' ,min(precio) 'precio mas bajo' , AVG(precio)'promedio'
   from libros
  group by editorial
  having max(precio)>30





