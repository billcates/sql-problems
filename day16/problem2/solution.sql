with cte as(
    SELECT extract(year from call_received) as yr,
    extract (month from call_received) as mh
    ,policy_holder_id
    FROM callers
    where call_duration_secs>=300
),
cte2 as(
    select 
    yr,
    mh,
    count(policy_holder_id) as ct
    from cte
    group by yr,mh
    order by yr,mh
),
final as
(
    select * ,
    lag(ct,1) over(order by yr,mh) as prev --note
    from cte2
)
select yr,mh,round(100.0*(ct-prev)/prev,1) as pct
from final


--Note: lag(ct,1,ct) should be used to avoid pct displaying as null