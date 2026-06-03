WITH music_users AS (
    SELECT DISTINCT e.user_id
    FROM events e
    WHERE e.type = 'Music'
),

music_with_join AS (
    SELECT 
        m.user_id,
        u.join_date
    FROM music_users m
    JOIN users u ON m.user_id = u.user_id
),

prime_check AS (
    SELECT 
        mj.user_id,
        CASE 
            WHEN MIN(JULIANDAY(e.access_date) - JULIANDAY(mj.join_date)) <= 30 
            THEN 1 
            ELSE 0 
        END AS converted
    FROM music_with_join mj
    LEFT JOIN events e 
        ON mj.user_id = e.user_id 
        AND e.type = 'P'
    GROUP BY mj.user_id, mj.join_date
)

SELECT 
    COUNT(*)                           AS total_users,
    SUM(converted)                     AS users_within_30_days,
    SUM(converted) * 100.0 / COUNT(*) AS percentage_within_30_days
FROM prime_check;