
-- Leetcode problem LeetCode SQL Premium Problem 2853: 'Highest Salary Difference'


-- DDL for Salaries table
CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);



/*
Write an SQL query to calculate the difference 
between the highest salaries 
in the marketing and engineering department. 
Output the absolute difference in salaries.
*/


SELECT * FROM Salaries;

with dept_max_salaries 
as 
(
SELECT 
	department,
	max(salary) as max_salary
from 
	Salaries
where 
	department in('Marketing', 'Engineering')
group by
	department
),
salary_diff as
(select
	max(case when department = 'Marketing' then max_salary end) as marketing_salary,
	max(case when department = 'Engineering' then max_salary end) as Engineering_salary
from
	dept_max_salaries
)

select
	abs(marketing_salary - Engineering_salary) as sal_diff
from
	salary_diff;

--- Solve the problem using case statement


select 
	abs(max(case when department = 'Marketing' then salary end) - 
	max(case when department = 'Engineering' then salary end)) as salary_diff
from Salaries


--- Solve the problem using rank function


with cte as 
(
select
	department,
	salary,
	dense_rank() over(partition by department order by salary desc) as rnk
from Salaries
where department in ('Marketing', 'Engineering')
),

salary_col as
(
	select 
		department,
		salary
			
	from cte
	where rnk = 1
		
)
select 
	abs(
	max(case when department = 'Marketing' then salary end) - 
	max(case when department = 'Engineering' then salary end)
	) as salary_diff
from 
	salary_col



	