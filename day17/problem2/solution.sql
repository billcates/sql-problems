with cte as(
    select 
    a.N,
    A.P,
    min(b.N) as child 
    from BST a 
    left join BST b on a.N=b.P
    group by a.N,a.P
)
select 
    N,
    case when p is NULL then 'Root'
    when child is NULL then 'Leaf'
    else 'Inner'
    end as type
from cte
order by N