-- SQL Day - 2


-- Create pages table
CREATE TABLE pages (
    page_id INTEGER PRIMARY KEY,
    page_name VARCHAR(255)
);



-- Insert data into pages table
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');


-- Create page_likes table
CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date TIMESTAMP,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);


-- Insert data into page_likes table
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');


/*
Question 1:
Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.
*/



select * from page_likes

select * from pages

select
	p.page_id
from pages as p
left join page_likes as pl
on p.page_id = pl.page_id
--where liked_date is null
group by p.page_id
having count(pl.page_id) = 0
order by p.page_id asc


SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
GROUP BY p.page_id
HAVING COUNT(pl.page_id) = 0
ORDER BY p.page_id ASC;



-- Question 2 App Click-through Rate (CTR) [Facebook SQL Interview Question]


-- Create the events table
CREATE TABLE events (
    app_id INTEGER,
    event_type VARCHAR(10),
    timestamp TIMESTAMP
);

-- Insert records into the events table
INSERT INTO events (app_id, event_type, timestamp) VALUES
(123, 'impression', '2022-07-18 11:36:12'),
(123, 'impression', '2022-07-18 11:37:12'),
(123, 'click', '2022-07-18 11:37:42'),
(234, 'impression', '2022-07-18 14:15:12'),
(234, 'click', '2022-07-18 14:16:12');


select * from events




/*

Question 2: 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.
Expected Output Columns: app_id, ctr
*/





select
	app_id,
	
	round((100.0 * sum(case when event_type = 'click' then 1 else 0 end) / count(*)), 2) as ctr
from 
	events
where extract(YEAR from (timestamp)) = '2022'	
group by app_id 
	





SELECT 
    app_id,
    ROUND((100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / COUNT(*)), 2) AS ctr
FROM 
    events
WHERE 
    YEAR(timestamp) = 2022
GROUP BY 
    app_id;




