select id,visit_date,no_of_people 
from(
    select *,
    lead(no_of_people,1) over(order by visit_date) as prev_1,
    lead(no_of_people,2) over(order by visit_date) as prev_2,
    lag(no_of_people,1) over(order by visit_date) as next_1,
    lag(no_of_people,2) over(order by visit_date) as next_2
    from stadium
)a
where 
(prev_1>=100 and prev_2>=100 and no_of_people>=100)
or (next_1>=100 and next_2>=100 and no_of_people>=100)
or (no_of_people>=100 and prev_1>100 and next_1>=100)