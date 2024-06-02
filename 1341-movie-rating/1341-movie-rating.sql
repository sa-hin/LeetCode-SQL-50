# Write your MySQL query statement below
(select name as results 
from Users inner join MovieRating using(user_id) 
group by user_id 
order by count(rating) desc, name 
limit 1) 
UNION ALL 

(select title as results 
from Movies inner join MovieRating using(movie_id)
where Month(created_at) = "02" and year(created_at) = "2020"
group by movie_id 
order by avg(rating) desc, title
limit 1
);
