with cte as(
    select *,
    lag(end_loc) over(partition by id order by start_time) as prev_loc 
    from drivers
)
select 
    id,
    count(1) as total_rides,
    sum(case when start_loc=prev_loc then 1 else 0 end) as profit_rides
from cte 
group by id
