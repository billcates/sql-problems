select 
    e.emp_id,
    e.emp_name,
    e.manager_id,
    e1.emp_name as manager_name,
    e1.manager_id as managers_manager_id ,
    e2.emp_name as managers_manager_name
from emp e 
left join emp e1 on e.manager_id=e1.emp_id
left join emp e2 on e1.manager_id=e2.emp_id