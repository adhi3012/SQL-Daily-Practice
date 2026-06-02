SELECT
    h.emp_name,
    SUM(h.bill_hrs * b.bill_rate) AS total_billing
FROM hoursworked h
JOIN billings b
    ON h.emp_name = b.emp_name
   AND b.bill_date = (
        -- Subquery: find the latest bill_date on or before the work_date
        SELECT MAX(b2.bill_date)
        FROM billings b2
        WHERE b2.emp_name = h.emp_name
          AND b2.bill_date <= h.work_date   -- ← the key condition
    )
GROUP BY h.emp_name;