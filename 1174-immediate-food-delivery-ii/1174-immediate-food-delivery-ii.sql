# Write your MySQL query statement below

select round(((sum(case when order_date = customer_pref_deliverY_date then 1 end)/
count(customer_id)) * 100), 2) as immediate_percentage 
from delivery 
where (customer_id, order_date) IN
(select customer_id, min(order_date) as first_order 
from delivery
group by customer_id);