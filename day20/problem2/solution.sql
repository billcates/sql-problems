select  
    a.id,
    b.age,
    b.coins_needed,
    b.power
from 
(
    select 
        w.code,
        wp.age,
        min(w.coins_needed) as coins_needed,
        w.power 
    from wands_property wp
    left join wands w on w.code=wp.code and wp.is_evil!=1
    group by 1,2,4 order by 4 desc, 2 desc
)b
inner join wands a
on a.code=b.code and a.coins_needed=b.coins_needed and a.power=b.power
order by b.power desc, b.age desc