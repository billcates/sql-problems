with cte as(
select * from trips t 
join users u 
join users u1
on t.client_id=u.users_id and t.driver_id=u1.users_id
where u.banned='No' and u1.banned='No'
),
final as(
select request_at,
sum(case
when status='completed' then 0
else 1
end) as cancelled_trips,
count(1) as total_trips
from cte
group by request_at
)
select request_at,round(cancelled_trips*(100.0)/total_trips,2) as cancelled_percent from final order by request_at