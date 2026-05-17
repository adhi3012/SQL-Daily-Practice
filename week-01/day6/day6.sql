select manager_id, avg(salary) as avg_salary 
from emp 
where salary > 5000
group by 1
having avg(salary) > 10000`