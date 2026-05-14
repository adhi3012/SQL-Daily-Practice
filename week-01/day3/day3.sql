with sal as ( 
select emp_id,val as salary from emp_compensation 
where salary_component_type='salary' 
)
,
bon as(
select emp_id,val as bonus from emp_compensation 
where salary_component_type='bonus'
)
,
hike as (
select emp_id,val as hike_percent from emp_compensation 
where salary_component_type='hike_percent'
)
select sal.emp_id, salary, bonus, hike_percent 
from  sal
left join bon on sal.emp_id= bon.emp_id
 left join hike on sal.emp_id = hike.emp_id