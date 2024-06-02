# Write your MySQL query statement below 

with cte as 
(select e.id,e.name as Employee,e.salary as Salary,e.departmentId,d.name as Department, 
dense_rank() over(partition by e.departmentId order by e.salary desc) as rank_
from Employee as e left join 
Department as d on e.departmentId= d.id) 
select  Department, Employee, 
Salary 
from cte 
where rank_ <=3;
