
select order_number,order_date,cust_id,i.salesperson_id,i.amount 
from int_orders i  inner join 
(select salesperson_id, max(amount) as amt from int_orders  group by  1) a on a.salesperson_id = i.salesperson_id and i.amount=a.amt