use AdventureWorks2012
go
grant select on Library.Books to userAW2016
grant select on Library.Publishers to userAW2016 
 
revoke select on Library.Publishers to userAW2016 

--desde LoginAW2016 select * from Library.Publishers
select * from Library.Books

grant update on Library.Publishers to userAW2016 
--desde LoginAW2016 update  Library.Publishers set publisherName = 'LOOOL' where publisherID = 12

grant delete on Library.Publishers to userAW2016 

--desde LoginAW2016  delete  Library.Publishers  where publisherID = 12


grant select on ufnGetContactInformation to userAW2016
grant exec on Library.udf_GetNumberOfBooks to userAW2016


create role Approle


--exec sp_addrolmember Approle, userAW2016

alter role Approle add member userAW2016

--añadirmos permisos al role
grant execute on Humanresources.uspUpdateEmployeeHireInfo to Approle
grant view definition on Humanresources.uspUpdateEmployeeHireInfo to Approle

