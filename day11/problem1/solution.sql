with cte as(
    select *,
    rank()over(partition by callerid,date(datecalled) order by datecalled) low_rk
    ,rank()over(partition by callerid,date(datecalled) order by datecalled desc) high_rk
    from phonelog
),
cte2 as(
    select callerid,
    date(datecalled) as dt,
    MIN(case when low_rk=1 then recipientid else NULL end) as fcaller,
    MAX(case when high_rk=1 then recipientid else NULL end) as lcaller
    from cte 
    group by callerid,date(datecalled)
)
select callerid,dt, fcaller as recipient 
from cte2
where fcaller=lcaller