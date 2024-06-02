# Write your MySQL query statement below
select machine_id, round(avg(processing_time),3) as processing_time
from 
( select machine_id, process_id, 
max(case when activity_type='end' then timestamp end)-
max(case when activity_type='start' then timestamp end)
as processing_time
from activity 
group by machine_id, process_id 
) as temp 
group by machine_id;



