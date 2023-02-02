with cte as(
    select * ,
    rank() over(partition by exam_id order by score desc) high_rk,
    rank() over(partition by exam_id order by score) low_rk
    from exams
),
cte2 as(
    select
    student_id,
    min(high_rk) as high_rk,
    min(low_rk) as low_rk from cte a
    group by student_id
)
select b.student_id,b.student_name
from cte2 as a 
join students b on a.student_id=b.student_id
and a.high_rk!=1 and a.low_rk!=1

