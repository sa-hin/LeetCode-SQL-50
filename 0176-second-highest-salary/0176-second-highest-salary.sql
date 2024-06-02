# Write your MySQL query statement below

with cte as (select id, salary, dense_rank() over(order by salary desc) as rank_
from Employee) 

select coalesce((select salary   from cte 
where rank_ = 2 limit 1),null) as SecondHighestSalary;
