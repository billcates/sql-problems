select a.* 
from int_orders a 
left join int_orders b on a.salesperson_id=b.salesperson_id
group by a.order_number,a.order_date,a.cust_id,a.salesperson_id
having a.amount>=max(b.amount)