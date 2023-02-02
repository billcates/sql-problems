with cte as(
    select *,
    row_number() over(order by (select NULL)) as rn --trick used order by select null to preserve the original order
    from brands
),
cte2 as(
    select *,
    count(category) over(order by rn) as grp_id 
    from cte
)
select max(category) over(partition by grp_id) as new_category,
brand_name 
from cte2