select 
t1.team_name,t2.team_name 
from teams t1 join teams t2
on t1.team_code<t2.team_code 
