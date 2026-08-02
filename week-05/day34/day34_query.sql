SELECT product
FROM (
    SELECT product,
           price,
           LEAD(price) OVER (PARTITION BY product ORDER BY date) AS next_price
    FROM prices
) t
WHERE next_price IS NOT NULL
GROUP BY product
HAVING COUNT(next_price) > 0
   ;
