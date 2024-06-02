# Write your MySQL query statement below
 
select p.product_name, sum(o.unit) as unit
from Products as p right join Orders as o on 
p.product_id = o.product_id 
where date_format(o.order_date, '%Y-%m') = '2020-02'
group by p.product_name
having sum(o.unit) >= 100;


