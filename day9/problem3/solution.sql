with cte as(
    select left(seat,1) as row ,
    substring(seat,2,3) as seat_no,occupancy,
    rank() over(partition by left(seat,1)order by left(seat,1),cast (substring(seat,2,3) as integer)) as rk 
    from movie
    where occupancy=0
),
final as
(
    select row,concat(row,seat_no) as seat,seat_no-rk as diff 
    from cte 
),
result as(
    select *,count(1) over(partition by row,diff) as num 
    from final
)
select seat from result where num>=4