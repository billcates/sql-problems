--Method 1
select *,
concat('Q',10-total)
from(
select store,sum(
case when Quarter='Q1' then 1 
when Quarter='Q2' then 2
when Quarter='Q3' then 3
when Quarter='Q4' then 4 end )as total from STORES
group by store)a

--select right(Quarter,1) from stores

--Method2
--can be solved using recursive cte and cross join