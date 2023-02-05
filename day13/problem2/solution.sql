--method 1
with cte as(
    select distinct p1.userid 
    from purchase_history p1
    left join purchase_history p2 on p1.userid=p2.userid and p1.productid=p2.productid
    and p1.purchasedate<p2.purchasedate
    where p2.userid is not NULL

union 

select userid 
from purchase_history
group by userid
having count(distinct purchasedate)<2
)
select distinct userid 
from purchase_history
where userid not in (select * from cte)


--method2

select userid,
    count(productid) as ct,
    count(distinct productid) as d_ct,
    count(distinct purchasedate) as p_date
from purchase_history
group by userid
having count(distinct purchasedate)>1 and count(productid)=count(distinct productid)