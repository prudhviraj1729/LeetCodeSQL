with Store as (select distinct customer_id from Orders where product_name = 'A' and customer_id in (select distinct customer_id from Orders where product_name = 'B' and customer_id not in (select distinct customer_id from Orders where product_name = 'C')))

select 
A.customer_id, B.customer_name from
Store A 
join
Customers B
on A.customer_id = B.customer_id;