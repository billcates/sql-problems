select 
    event_date,
    count(distinct user_id) as active_users_count
from activity
group by event_date
order by event_date