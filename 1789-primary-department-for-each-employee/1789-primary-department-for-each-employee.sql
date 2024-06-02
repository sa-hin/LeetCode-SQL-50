# Write your MySQL query statement below

select employee_id, department_id 
from Employee where employee_id 
In(select employee_id from employee 
group by employee_id
having count(employee_id) =1)
and primary_flag = "N"

UNION ALL 

select employee_id, department_id 
from Employee where 
primary_flag = "Y"
