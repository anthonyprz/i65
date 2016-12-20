SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony
-- Create date: 02/12/2016
-- Description:	Lista de Editoriales
-- =============================================
CREATE FUNCTION Library.udf_GetNumberOfBooks 
(
	-- Add the parameters for the function here
	@PublisherID int
)
RETURNS int
AS
BEGIN
	
	DECLARE @Result int =0

	
	SELECT @Result = (select COUNT(*) from library.books
					 where bookpublisherId = @PublisherID)

	
	RETURN @Result

END
GO



select p.publisherName, p.publisherID,  Library.udf_GetNumberOfBooks(p.publisherID) 
from library.publishers p

select * from library.publishers
select * from library.books
					
					