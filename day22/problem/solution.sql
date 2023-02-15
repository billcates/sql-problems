WITH cte AS 
    (SELECT *,
           dateadd(day, - row_number()over(order by start_date),start_date) dt
    FROM PROJECTS
    )

SELECT MIN(start_date),
       MAX(end_date)
FROM cte
GROUP BY dt
ORDER BY COUNT(dt),MIN(start_date);