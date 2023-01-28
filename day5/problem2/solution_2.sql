select datepart(week,event_date) as week, count(distinct user_id) as weekly_active_users
from activity
group by datepart(week,event_date)
order by datepart(week,event_date)
