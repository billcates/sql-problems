with cte as 
(
select a1.*
from activity a1
join activity a2 
on a1.user_id=a2.user_id and a1.event_date=a2.event_date 
and a1.event_name='app-installed'
and a2.event_name='app-purchase'
)
select a.event_date,count(distinct b.user_id) 
from (select event_date  from activity group by event_date) a 
left join cte b on a.event_date=b.event_date 
group by a.event_date
order by a.event_date