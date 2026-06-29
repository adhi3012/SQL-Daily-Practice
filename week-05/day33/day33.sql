select * from emp

order by dep_id,salary desc;

with a as (
Select *, row_number() over(partition by dep_id order by salary desc ) as rn,
count() over(partition by dep_name ) as cnt
from emp )
, b as (
select dep_id,min(salary)  as salary from emp group by dep_id)
select emp_id,emp_name,salary,dep_id,dep_name,rn,cnt 
from a where rn=3 or (cnt < 3 and rn=cnt) order by dep_id asc

