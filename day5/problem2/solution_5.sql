with cte as(
    select a2.* 
    from activity a1
    left join activity a2 on a1.user_id=a2.user_id 
    where a1.event_name='app-installed' 
    and a2.event_name='app-purchase'
    and datediff(day,a1.event_date,a2.event_date)=1
),
dates as(
    select distinct event_date from activity
)
select 
a.event_date,
count(b.user_id)
from dates a 
left join cte b on a.event_date=b.event_date
group by a.event_date