with cte as(
    select case when country in ('India','USA') then country else 'Others' END as new_country,
    count(distinct user_id) as users
    from activity 
    where event_name='app-purchase'
    group by case when country in ('India','USA') then country else 'Others' END 
),
final as(
    select sum(users) as total from cte
)
select *,round(users*(100.0)/total,2) as pct 
from cte,final

