
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION udf_clientes_NombreCliente 
(	
	@idCliente varchar(5)
)
RETURNS varchar(61)
AS
BEGIN	
	DECLARE @Result varchar(60)
	SELECT @Result = concat(c.NombreCliente, ' ', c.ApellidoCliente) 
	from cliente c
	where c.idCliente =	@idCliente
	RETURN @Result
END
GO
----------------------------------------------------------------------------------------------------------------------

alter table cliente
add edad as datediff(year,FechaNacimiento,getdate())

select * from cliente 
-------------------------------------------------------------------------------------------------

select c.NombreCliente, c.ApellidoCliente, dbo.udf_clientes_NombreCliente(c.idCliente)
from cliente c