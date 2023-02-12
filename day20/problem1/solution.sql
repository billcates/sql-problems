select 
    s.hacker_id,
    h.name 
from submissions s
join hackers h on h.hacker_id=s.hacker_id
join challenges c on c.challenge_id=s.challenge_id
join difficulty d on d.difficulty_level=c.difficulty_level
where s.score=d.score
group by s.hacker_id,h.name 
having count(distinct s.challenge_id)>1
order by count(distinct s.challenge_id) desc,s.hacker_id
