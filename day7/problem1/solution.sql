select company_id 
from 
(
    select company_id,
    user_id 
    from company_users
    where language in ('English','German')
    group by company_id,user_id
    having count(distinct language)=2
)a
group by company_id
having count(distinct user_id)=2