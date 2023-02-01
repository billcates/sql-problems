with cte as(
    select *,
    rank() over(partition by dep_id order by salary desc) as rk,
    count(emp_id) over(partition by dep_id) as cnt 
    from emp
)
select * 
from cte 
where rk=3 or (cnt<3 and rk=cnt)