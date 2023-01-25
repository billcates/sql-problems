select 
a.user_id as buyer_id,
a.join_date as join_date,
sum(
    case when extract(year from b.order_date)='2019' then 1
    else 0
    end
)as orders_in_2019
from users a 
left join orders b on a.user_id=b.buyer_id
group by a.user_id
