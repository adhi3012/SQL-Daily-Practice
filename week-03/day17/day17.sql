WITH cte AS (
    SELECT seat_no,
           is_empty,
           LAG(is_empty,1)  OVER(ORDER BY seat_no) AS prev_1,
           LAG(is_empty,2)  OVER(ORDER BY seat_no) AS prev_2,
           LEAD(is_empty,1) OVER(ORDER BY seat_no) AS next_1,
           LEAD(is_empty,2) OVER(ORDER BY seat_no) AS next_2
    FROM bms
)
SELECT *
FROM cte
WHERE is_empty = 'Y'
AND (
    (COALESCE(prev_2,'N') = 'Y' AND COALESCE(prev_1,'N') = 'Y')  -- I'm the RIGHT end
    OR
    (COALESCE(prev_1,'N') = 'Y' AND COALESCE(next_1,'N') = 'Y')  -- I'm the MIDDLE
    OR
    (COALESCE(next_1,'N') = 'Y' AND COALESCE(next_2,'N') = 'Y')  -- I'm the LEFT end
);