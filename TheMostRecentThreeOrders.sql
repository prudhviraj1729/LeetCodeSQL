select 
B.name as customer_name,
A.customer_id,
A.order_id,
A.order_date 
from
(select order_id,
order_date,
customer_id,
cost, row_number() over(partition by customer_id order by order_date DESC) as rnk
from Orders) A 
Join
Customers B on A.customer_id = B.customer_id
where A.rnk <= 3
order by customer_name ASC, customer_id ASC, order_date DESC;