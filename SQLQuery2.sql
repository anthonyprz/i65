--create database Prueba
--sp_helpdb prueba
--use master 
--go 
--create database mibase

--select name, size
--from sys.master_files
--where name = 'mibase'

--select * from sysdatabases
--where name = 'mibase'

--drop database PruevaGrafica;

/*
use master;
GO
create database Sales
on
(name = Sales_dat,
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50MSSQLSERVER\MMSQL\DATA\saledat.mdf',
		size = 10,
		maxsize = 50,
		filegrouwth = 5)
		log on 
		*/
/*

create database VENTAS
on primary
(name= archivo1,
filename='C:\DATA\VENTAS_DAT1.MDF',
size = 80MB,
maxsize = 200MB,
filegrowth=20),

(name= archivo2,
filename='C:\DATA\VENTAS_DAT2.NDF',
size = 80MB,
maxsize = 200MB,
filegrowth=20),

(name= archivo3,
filename='C:\DATA\VENTAS_DAT3.NDF',
size = 80MB,
maxsize = 200MB,
filegrowth=20)

LOG ON
(name= archivoLog,
filename='C:\DATA\VENTAS_log.lDF',
size = 80MB,
maxsize = 200MB,
filegrowth=20)

*/

ALTER DATABASE VENTAS

 add FILEGROUP
 ( NAME = ventasgroup1_dat,
 filename='C:\DATA\grupo.NDF',
 size = 80MB,
maxsize = 200MB,
filegrowth=20)
