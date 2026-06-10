with a as  (Select company_id,user_id,count(*) from company_users
where language in ('English','German')
group by 1,2
having count(*)=2 
)
select company_id, count(1)
from a 
group by 1
having count(distinct user_id) =2 