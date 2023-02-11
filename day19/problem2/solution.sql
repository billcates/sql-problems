with cte as(
    select 
    s.id ,
    s.name,
    p.salary
    from students s
    join packages p on s.id=p.id
),
cte2 as(
    select 
    a.id,
    a.name,
    a.salary,
    f.friend_id,
    p.salary as friend_salary
    from cte a
    join friends f on a.id=f.id
    join packages p on f.friend_id=p.id
)
select a.name 
from cte2 a
where a.salary<a.friend_salary
order by a.friend_salary