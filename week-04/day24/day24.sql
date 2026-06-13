SELECT
    sms_date,
    min(sender, receiver)      AS p1,
    max(sender, receiver)   AS p2,
    SUM(sms_no)                  AS total_sms
FROM subscriber
GROUP BY
    min(sender, receiver),
    max(sender, receiver),
    sms_date
ORDER BY sms_date;