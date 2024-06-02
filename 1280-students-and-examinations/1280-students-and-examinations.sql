# Write your MySQL query statement below

select st.student_id , st.student_name, su.subject_name, 
coalesce(count(e.subject_name),0)  as attended_exams
from Students as st cross join Subjects as su 
left join Examinations as e 
on st.student_id = e.student_id and 
su.subject_name = e.subject_name 
group by st.student_id, st.student_name, su.subject_name 
order by st.student_id, su.subject_name;
