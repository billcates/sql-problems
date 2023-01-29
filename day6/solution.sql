select seat_no,
is_empty 
from(
    select *,
        lag(is_empty,2)  over(order by seat_no) as prev_2,
        lag(is_empty,1) over(order by seat_no) as prev_1,
        lead(is_empty,1)  over(order by seat_no) as next_1,
        lead(is_empty,2)  over(order by seat_no) as next_2
    from bms
) a
where (is_empty='Y' and prev_2='Y' and prev_1='Y')
or (is_empty='Y' and next_1='Y' and prev_1='Y')
or (is_empty='Y' and next_1='Y' and next_2='Y')