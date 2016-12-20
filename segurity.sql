USE [master]
GO
CREATE LOGIN [loginsub] WITH PASSWORD=N'123', 
DEFAULT_DATABASE=[subconsultas],
DEFAULT_LANGUAGE=[Español], 
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [subconsultas]
GO
CREATE USER [usersub] FOR LOGIN [loginsub]
GO
