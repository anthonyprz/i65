create database BDAnuncios
go
use BDAnuncios
go

-------------------------------------------------------------------------------categoria
create table categoria(
codigoCategoria int primary key,
categoria varchar(50) not null
)
-------------------------------------------------------------------------------subcategoria
create table subcategoria(
codigoSubCategoria int  primary key,
subcategoria varchar(50) not null,
categoria int not null,
foreign key (categoria) references categoria(codigoCategoria)
)
-------------------------------------------------------------------------------localidad
create table localidad(
codigo int  primary key,
nombre varchar(50) not null,
provincia varchar(50) not null
)
-------------------------------------------------------------------------------fotografia
create table fotografia(
codigo int identity primary key,
nombreArchivo varchar(50) not null
)
-------------------------------------------------------------------------------usuario
create table usuario(
codigoUsuario int  primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
email varchar(30) not null,
telefono varchar(10),
estado char(1) not null
)
-------------------------------------------------------------------------------anuncio
create table anuncio(
codigoAnuncio int primary key,
texto varchar(90) not null,
fecha date not null,
precio money not null,
codLocalidad  int,
foreign key (codLocalidad) references localidad(codigo),
codCategoria int,
foreign key (codCategoria) references categoria(codigoCategoria),
codigoSubCategoria int,
foreign key (codigoSubCategoria) references subcategoria(codigoSubCategoria),
codigoUsuario int,
foreign key (codigoUsuario) references usuario(codigoUsuario)
)
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------