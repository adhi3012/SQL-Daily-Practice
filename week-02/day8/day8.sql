with a as (
SELECT first_player AS player_id, first_score AS score 
FROM matches
UNION ALL
SELECT second_player AS player_id, second_score AS score 
FROM matches
)
,
b as 
(
select group_id, p.player_id,sum(score) as score, 
rank() over(partition by group_id order by sum(score) desc, p.player_id asc ) as rnk 
from players p
inner join a on p.player_id= a.player_id
group by 1,2
)
select 
group_id,
player_id, 
score
from b
where rnk =1