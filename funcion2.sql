
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony
-- Create date: 2/3/1016
-- Description:	clientes mayores de 20
-- =============================================
CREATE FUNCTION udf_Clientes_EdadSuperior20 ()
RETURNS 
@Table_Var TABLE 
(
	NombreCliente varchar(30), 
	ApellidoCliente varchar(30),
	edad tinyint
)
AS
BEGIN
	insert into @Table_Var (NombreCliente,ApellidoCliente,edad)
	(select c.NombreCliente,c.ApellidoCliente,c.edad
	from Cliente c
	where c.edad>20
	)

	RETURN 
END
GO

select * from dbo.udf_Clientes_EdadSuperior20()

