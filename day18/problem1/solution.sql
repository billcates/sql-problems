select
    c1.company_code,
    c1.founder,
    count(distinct lm.lead_manager_code),
    count(distinct sm.senior_manager_code),
    count(distinct e.employee_code)
from company c1
join lead_manager lm on c1.company_code=lm.company_code
join senior_manager sm on c1.company_code=sm.company_code
join manager m on c1.company_code=m.company_code
join employee e on e.company_code=c1.company_code
group by c1.company_code,c1.founder
order by c.company_code