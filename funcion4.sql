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
-- Create date: 02/12/2016
-- Description:	Lista de libros según una fecha
-- =============================================
CREATE FUNCTION Library.udf_BooksByDate 
(	
	-- Add the parameters for the function here
	@fechaini date, 
	@fechafin date
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 0
)
GO


use AdventureWorks2012;
go
----------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony
-- Create date: 02/12/2016
-- Description:	Lista de libros según una fecha
-- =============================================
CREATE FUNCTION library.udf_BooksByDate 
(
@fecha1 date,
@fecha2 date
)
returns
@Table_Var table(
BookId int,
BookTitle varchar(100),
BookDescription varchar(100),
BookPages int
)
as 
begin
	insert into @Table_Var select b.BookId,b.BookTitle,B.Bookdescriptions,b.BookPages
							from library.Books b
							where b.BookDate between @fecha1 and @fecha2
							RETURN 
end
