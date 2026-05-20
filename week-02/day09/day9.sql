with rnk_order as (
select * ,  row_number() over ( partition by seller_id order by order_date asc) as rnk 
from orders
)

select u.user_id as seller_id,
case when i.item_brand=u.favorite_brand then 'Yes' else 'No' end as item_fav_brand

from users u 
left join rnk_order rn on u.user_id = rn.seller_id and rn.rnk=2
left join items i on i.item_id = rn.item_id