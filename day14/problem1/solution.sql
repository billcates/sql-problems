select 
    COALESCE(a.id,b.id),
    case when a.id is null then 'New in Target'
    when b.id is null then 'New in Source'
    when a.name<>b.name then 'Mismatch'
    end as comments
from source a
full outer join target b on a.id=b.id 
where a.id is null or b.id is null or a.name<>b.name