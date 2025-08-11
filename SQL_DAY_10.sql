
CREATE TABLE Transactionss (
    id INT PRIMARY KEY,
    country VARCHAR(255),
    state VARCHAR,
    amount INT,
    trans_date DATE
);
SELECT * FROM Transactionss
INSERT INTO Transactionss (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');


/*
Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
the number of approved transactions and their total amount.
*/


select 
	country,
	extract(month from trans_date) as mnth,
	count(trans_date) as num_tran,
	sum(amount) as total_amount
from Transactionss
where state = 'approved'
group by 1,2





SELECT 
	TO_CHAR(trans_date, 'YYYY-MM') as month,
	country,
	COUNT(1) as trans_count,
	SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) as approved_count,
	SUM(amount) as trans_total_amount,
	SUM(CASE WHEN state= 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM transactionss
GROUP BY 1, 2;


select
	to_char(trans_date, 'yyyy-mm') as month,
	country,
	count(1) as trans_count,
	sum(case when state = 'approved' then 1 else 0 end) as approved_count,
	sum(amount) as trans_total_amount,
	sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from transactionss
group by 1,2



