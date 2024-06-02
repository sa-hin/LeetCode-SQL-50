# Write your MySQL query statement below

with large_num as
(select num from mynumbers 
group by num
having count(num)= 1
order by num desc) 

select max(num) as num from large_num;
