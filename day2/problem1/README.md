# sql-problems
## day2

Write a query to find the winner in each group

The winner in each group is the player who scored the maximum total points within the group.Incase of a tie,the lowest player_id wins

Players table:
Player_id -id which represent the player
Group_id -id which represents the group of the player

Matches table:
match_id - primary key of the table
first_player -represents the player_id of the players table who finished first
second_player -represents the player_id of the players table who finished second
first_score -points given to the player who secured 1 st place
second_score -points given to the player who secured 2nd place