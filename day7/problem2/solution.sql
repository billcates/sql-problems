with cte as
(
    select *,
    sum(cost) over(order by cost rows between unbounded preceding and 0 following) as m_sum
    from products
)
select 
    a.customer_id,
    a.budget,
    max(m_sum) as max_buy,
    string_agg(product_id,',') as product_list
from customer_budget a 
left join cte b on a.budget>b.m_sum
group by customer_id,a.budget