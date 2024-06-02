# Write your MySQL query statement below
select em.unique_id,es.name 
from employees as es left join EmployeeUNI as em
on em.id=es.id;