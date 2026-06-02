with cte as (
Select *,count(1) over(partition by username) as total_activities
,rank() over (partition by username order by StartDate desc) as rnk
from UserActivity
)
select * from cte  where rnk=2 or total_activities =1 ;


