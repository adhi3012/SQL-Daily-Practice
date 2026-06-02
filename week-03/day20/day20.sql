Select student_id from exams
where subject in ('Physics','Chemistry')
group by student_id
having count (distinct subject) =2 and count (distinct marks) = 1
