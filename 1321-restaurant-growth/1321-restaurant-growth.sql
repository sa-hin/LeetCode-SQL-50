# Write your MySQL query statement below
select visited_on, 
(select sum(amount) from customer
where  visited_on between date_sub(c.visited_on, interval 6 day) and c.visited_on
) as amount,
(select round(sum(amount)/7,2) from customer
where visited_on between date_sub(c.visited_on,interval 6 day) and c.visited_on
) as average_amount

from customer as c 
where c.visited_on >= (
    select Date_add(min(visited_on),interval 6 day) 
    from customer
) 
group by c.visited_on
order by c.visited_on;












