WITH city_first_year AS (
    SELECT 
        city_id,
        MIN(CAST(strftime('%Y', business_date) AS INTEGER)) AS first_year
    FROM business_city
    GROUP BY city_id
)
SELECT 
    first_year AS bus_year,
    COUNT(city_id) AS num_of_new_cities
FROM city_first_year
GROUP BY first_year
ORDER BY first_year;
