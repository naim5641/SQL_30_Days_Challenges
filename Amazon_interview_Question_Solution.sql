-- Q1. Write an SQL query to find the name of the product with the highest 
-- price in each country.

select * from suppliers
select * from products

select
	*
	from
(
select 
	s.country,
	p.product_id,
	p.product_name,
	p.price,
	dense_rank() over(partition by s.country order by p.price desc) as rnk
	--row_number() over(partition by s.country order by p.price desc) as rnk,
	
from 
 	products as p
join suppliers as s
on s.supplier_id = p.supplier_id

) as t
where rnk = 1




WITH CTE
AS (SELECT 
		s.country,
		p.product_name,
		p.price,
		ROW_NUMBER()	OVER(PARTITION BY s.country ORDER BY p.price DESC) as rn
	FROM products as p
	JOIN suppliers as s
	ON s.supplier_id = p.supplier_id
	)
SELECT 
	product_name, price,
	country
FROM CTE
WHERE rn =1;




-- Q.2 

/* 
You have two tables: Customer and Transaction.
- Customer Table Columns: Customer_id, Customer_Name, Registration_Date
- Transaction Table Columns: Transaction_id, Customer_id, Transaction_Date, Amount

-- Write an SQL query to calculate the total transaction amount for each customer for the current year. 
The output should contain Customer_Name and the total amount.
*/

-- 1. find total transaction amt group by each customer filter with current year 
-- put where condition to check if the transaction are current year year 1  

select * from Transaction
select * from Customers


select 
	c.customer_name,
	sum(T.amount) as totl_amount
from Transaction as T
join Customers as c
on c.Customer_id = T.Customer_id
where extract(year from T.transaction_date) = '2024'
group by c.customer_name




SELECT
	c.customer_name,
	c.customer_id,
	SUM(t.amount) total_amt
FROM customers as c
JOIN transaction as t
ON c.customer_id = t.customer_id
WHERE EXTRACT(YEAR FROM t.Transaction_Date) = '2024'
GROUP BY 1, 2

-- verifying it
SELECT
	SUM(amount)
FROM Transaction
WHERE customer_id = 1 AND EXTRACT(YEAR FROM Transaction_Date) = '2024'



