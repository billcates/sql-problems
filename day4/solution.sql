with cte as(
select * from events
where type='Music'
)
select round(count(e2.user_id)/count(e1.user_id),2)
from cte e1 
left join events e2 
on e1.user_id=e2.user_id and datediff(day,e1.access_date,e2.access_date)<=30 and e2.type='P'