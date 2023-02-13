select a.hacker_id,b.name,sum(a.score) 
from
(select hacker_id,challenge_id,max(score) as score
from submissions
group by 1,2)a
join hackers b on a.hacker_id=b.hacker_id
group by 1,2 having sum(score)>0
order by sum(a.score) desc,a.hacker_id 