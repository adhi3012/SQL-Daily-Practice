with per_cte 
as 
(Select count(distinct studentname) as cnt_1
from students
where marks > 90 
)
select cnt_1 * 100 / count(distinct studentname)  as  perc 
from students
join per_cte on 1=1
