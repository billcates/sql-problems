with final as(
    select a.*,b.name as name 
    from orders a 
    join products b on a.product_id=b.id
),
out as(
    select a.order_id,a.customer_id,concat(a.name,' ',b.name) as combination
    from final a join final b on a.order_id=b.order_id and a.product_id<b.product_id
)
select combination,count(1) from out
group by combination
