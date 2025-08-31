
DROP TABLE IF EXISTS orders;

-- Create the orders table
CREATE TABLE orders (
    user_id INT,
    item_ordered VARCHAR(512)
);

-- Insert sample data into the orders table
INSERT INTO orders VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

-- Expected Output Columns: user_id

-- -----------------------
-- My Solution
-- -----------------------

select * from orders

select
	user_id
from 
	orders
group by 
	user_id
having count(distinct item_ordered) = 2
and
	sum(case when item_ordered in('Burger', 'Cold Drink')
		then 1
		else 0
	end
	
	) = 2









