with cte as(
    select 
    player,
    sum(score) as score
    from
    (
        select 
        first_player as player,
        first_score as score 
        from matches
        union all
        select 
        second_player as player,
        second_score as score 
        from matches
    )a 
    group by player
),
final as(
    select 
    a.player as player,
    a.score as score,
    b.group_id as group_id,
    rank() over(partition by b.group_id order by a.score desc,a.player asc) as rk
    from cte a 
    join players b on a.player=b.player_id
)
select * from final where rk=1;
