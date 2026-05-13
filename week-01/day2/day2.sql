

WITH floor_visits AS (
    SELECT name, floor,
        RANK() OVER (
            PARTITION BY name 
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM entries
    GROUP BY 1, 2
),
tv AS (
    SELECT name, COUNT(*) AS total_visits
    FROM entries
    GROUP BY name
),
resource AS (
    SELECT name, 
        GROUP_CONCAT(DISTINCT resources) AS used_resources
    FROM entries
    GROUP BY name
)
SELECT 
    fv.name,
    fv.floor AS most_visited_floor,
    tv.total_visits,
    re.used_resources
FROM floor_visits fv
INNER JOIN tv ON fv.name = tv.name
INNER JOIN resource re ON fv.name = re.name
WHERE rn = 1;