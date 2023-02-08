WITH cte AS (
    SELECT
    policy_holder_id,
    call_received,
    EXTRACT(EPOCH FROM call_received 
        - LAG(call_received) OVER (
        PARTITION BY policy_holder_id 
        ORDER BY call_received)
    )/(24*60*60) AS day_diff
    FROM callers
)

SELECT COUNT(distinct policy_holder_id) AS patient_count
FROM cte
WHERE day_diff <= 7;