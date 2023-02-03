with cte as (
    select *,sum(salary)over(partition by experience order by salary) as running_sum  
    from candidates
)
select * 
from cte 
where experience='Senior' 
and running_sum<70000

union all

select * 
from cte 
where experience='Junior'
and (select max(running_sum) from cte where experience='Senior' and running_sum<70000)+running_sum<70000

order by emp_id