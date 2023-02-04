with cte as(
    select a.order_id as a,b.order_id as b 
    from tbl_orders a
    full outer join tbl_orders_copy b on a.order_id=b.order_id 
    where a.order_id is NULL or b.order_id is NULL
    )
select coalesce(a,b),
case when a is NULL then 'I'
when b is NULL then 'D' end as flag
from cte