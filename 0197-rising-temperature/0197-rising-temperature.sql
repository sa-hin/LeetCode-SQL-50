# Write your MySQL query statement below
select w.id
from Weather as w 
join Weather as w_prev 
on w.recordDate= Date_add(w_prev.recordDate, interval 1 day) 
where w.temperature > w_prev.temperature;