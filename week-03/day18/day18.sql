with cte as (
select distinct s1.store  as store , s2.Quarter as Quarter
from stores s1,  stores s2
)
select   c.store as Store ,c.quarter as q_no   from cte as c
left join  stores as s on c.store=s.store and c.quarter=s.quarter
where s.quarter is null