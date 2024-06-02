# Write your MySQL query statement 

with CumulativeWeight as (
    select person_name,weight, 
    turn, 
    sum(weight) over(order by turn)  as total_weight 
    from Queue
) 
select person_name 
from CumulativeWeight
where total_weight <= 1000 
order by turn desc 
limit 1;  