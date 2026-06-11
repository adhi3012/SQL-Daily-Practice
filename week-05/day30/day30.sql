
with b as (select * ,
sum(case when status='on' and prev_status='off' then 1 else 0 end ) over(order by event_time asc) as group_key 
 from (Select * , 
lag(status,1,status) over(order by event_time asc) as prev_status
from event_status) a
)
select min(event_time) as login , max (event_time) as logout , count(*) -1 as on_count
from b
group by group_key