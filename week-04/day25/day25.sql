with avg_cte 
as (
Select subject, avg(marks)  as  avg_marks from students
group by subject
)

select *,avg_marks from students s left join avg_cte a on a.subject = s.subject
where marks > avg_marks