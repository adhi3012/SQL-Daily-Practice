WITH a AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS rn,
           COUNT(*) OVER (PARTITION BY company) AS total
    FROM employee
)
SELECT 
    company,
    AVG(salary * 1.0) AS median_salary
FROM a
WHERE rn IN (
    FLOOR((total + 1) / 2.0),
    CEIL((total + 1) / 2.0)
)
GROUP BY company;