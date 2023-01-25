with cte as( 
    select 
        a.item_id,
        a.seller_id,
        a.rk,b.item_brand,
        c.favorite_brand 
    from
    (
        select 
            order_date,
            item_id,seller_id,
            rank()over(partition by seller_id order by order_date) as rk
        from orders
    )a
    join items b on a.item_id=b.item_id
    join users c on a.seller_id=c.user_id
    where rk=2
)
select 
    a.user_id as user_id,
    case when cte.rk=2 and cte.item_brand=cte.favorite_brand then "yes"
    when cte.rk=2 and cte.item_brand!=cte.favorite_brand then "no"
    else "no.op"
    END
from users a 
left join cte on cte.seller_id=a.user_id
order by a.user_id
