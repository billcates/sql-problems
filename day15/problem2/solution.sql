with cte as(
    SELECT 
    p1.topping_name as a_name,p1.ingredient_cost as a_cost,
    p2.topping_name as b_name,p2.ingredient_cost as b_cost,
    p3.topping_name as c_name,p3.ingredient_cost as c_cost 
    FROM 
    pizza_toppings p1,
    pizza_toppings p2,
    pizza_toppings p3
    where p1.topping_name<p2.topping_name
    and p2.topping_name<p3.topping_name
)
select 
    concat(a_name,',',b_name,',',c_name) as name,
    sum(a_cost+b_cost+c_cost) as cost
from cte 
group by a_name,b_name,c_name
order by sum(a_cost+b_cost+c_cost) desc,a_name asc,b_name asc,c_name asc