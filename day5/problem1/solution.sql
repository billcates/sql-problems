with cte as
(
    select *,rank()over(partition by username order by startdate) as rk 
    from UserActivity
)
select username,activity,startdate,enddate 
from cte
where rk=2
union ALL
select * from UserActivity 
where username in 
(
    select distinct username 
    from UserActivity 
    group by username having count(1)=1
)