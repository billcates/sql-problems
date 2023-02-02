with cte as(
    select 
    call_number,
    sum(case when call_type='OUT' then call_duration else 0 end) as out
    ,sum(case when call_type='INC' then call_duration else 0 end) as inco
    from call_details 
    where call_type!='SMS' 
    group by call_number 
    having count(distinct call_type)=2
)
select * from cte where out>inco