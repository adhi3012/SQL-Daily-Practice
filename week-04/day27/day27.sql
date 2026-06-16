with a as (Select *, rank() over(partition by subject order by marks desc  ) as high_rnk,
rank() over(partition by subject order by marks asc  ) as low_rnk
from students),
b as (
select subject,marks
from a 
where high_rnk=2
)
,
c as (
select subject,marks
from a 
where low_rnk=2)
select  distinct b.subject,b.marks as second_highest_marks , c.marks as second_lowest_marks
from b join c on c.subject = b.subject
