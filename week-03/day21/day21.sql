with cte as (Select *,
rank() over(partition by city order by days asc) as rnk_day,
rank() over(partition by city order by cases asc) as rnk_case,
rank() over(partition by city order by cases asc) - rank() over(partition by city order by days asc)  as diff
from covid
)
select  distinct city
from cte 
group by city
having count (distinct diff) = 1
