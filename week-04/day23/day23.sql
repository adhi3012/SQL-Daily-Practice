with running_cost
as  
(select *, SUM(COST) OVER(ORDER BY COST ASC)  AS r_cost
from products
)
SELECT

    cb.customer_id,

    cb.budget,

    COUNT(rc.product_id) AS no_of_products,

    GROUP_CONCAT(rc.product_id, ',') AS list_of_products   -- SQLite uses GROUP_CONCAT

FROM customer_budget cb


LEFT JOIN running_cost rc

    ON rc.r_cost <= cb.budget

GROUP BY

    cb.customer_id,

    cb.budget;


