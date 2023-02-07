SELECT 
    COALESCE(a.user_id,b.user_id),
    case
    when b.user_id is NULL then 'CHURN'
    when b.user_id is not NULL and a.status='NEW' then 'EXISTING'
    when b.user_id is not NULL and a.status='EXISTING' then 'EXISTING'
    when b.user_id is not NULL and a.status='CHURN' then 'RESURRECT'
    when b.user_id is not NULL and a.status='RESURRECT' then 'EXISTING'
    when a.user_id is NULL then 'NEW'
    end as new_status
FROM advertiser a
full outer join daily_pay b on a.user_id=b.user_id
order by COALESCE(a.user_id,b.user_id);