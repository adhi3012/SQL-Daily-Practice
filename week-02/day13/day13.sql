SELECT

    STRFTIME('%m', this_month.order_date) AS month_date,

    COUNT(DISTINCT last_month.cust_id) AS returning_customers

FROM transactions AS this_month

LEFT JOIN transactions AS last_month

    ON this_month.cust_id = last_month.cust_id

    AND (

        (CAST(STRFTIME('%Y', this_month.order_date) AS INTEGER) - CAST(STRFTIME('%Y', last_month.order_date) AS INTEGER)) * 12 +

        (CAST(STRFTIME('%m', this_month.order_date) AS INTEGER) - CAST(STRFTIME('%m', last_month.order_date) AS INTEGER))

    ) = 1

GROUP BY STRFTIME('%m', this_month.order_date);