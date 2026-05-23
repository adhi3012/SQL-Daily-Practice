SELECT   pr1.name || ' ' || pr2.name AS pair,      
    COUNT(*) AS purchase_freq
FROM 
orders  o1
 join orders o2 on  o1.order_id= o2.order_id
JOIN products pr1

    ON pr1.id = o1.product_id

JOIN products pr2

    ON pr2.id = o2.product_id
where o1.product_id < o2.product_id
group by pr1.name,pr2.name