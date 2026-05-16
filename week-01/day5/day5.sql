with score_details 
as 
(select pid, sum(p.score) as total_friend_score ,  count(*)  as no_of_friends
from person p
join friend f on p.personid = f.fid   
group by 1
having sum(p.score) > 100)
select 
s.* , p.name as person_name 
from score_details s 
inner join person p on s.pid = p.personid