# Write your MySQL query statement below

WITH FirstLogin AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_login_date
    FROM 
        Activity
    GROUP BY 
        player_id
),
ConsecutiveLogins AS (
    SELECT 
        a.player_id
    FROM 
        Activity a
    JOIN 
        FirstLogin fl 
        ON a.player_id = fl.player_id
    JOIN 
        Activity a2 
        ON a.player_id = a2.player_id 
        AND a.event_date = fl.first_login_date + INTERVAL 1 DAY
)
SELECT 
    ROUND(COUNT(DISTINCT cl.player_id) / COUNT(DISTINCT fl.player_id), 2) AS fraction
FROM 
    FirstLogin fl
LEFT JOIN 
    ConsecutiveLogins cl 
    ON fl.player_id = cl.player_id;

