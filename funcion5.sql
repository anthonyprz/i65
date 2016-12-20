-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony
-- Create date: 5/2/2016
-- Description:	=D
-- =============================================
CREATE FUNCTION udf_ObtenerEmpleados 
(	
	-- Add the parameters for the function here
	@dept_no int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * from EMPLE e
	where e.dept_no =@dept_no
)
GO


select *  from udf_ObtenerEmpleados(10)
				   --inner join
select * from DEPART d cross apply dbo.udf_ObtenerEmpleados(10)
order by d.dept_no

