/*
sp_whoisactive

select count(1)
from dbo.ftUsers with(nolock) 
*/

-- In Memory Table

DECLARE @tv TABLE(i int, v varchar); -- <= 1 000

-- In Disk Table

CREATE table #local_tmp_tbl (i int, v varchar); -- > 1 000

CREATE table ##global_tmp_tbl (i int, v varchar); -- > 1 000