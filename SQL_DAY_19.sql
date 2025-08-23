
CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);

-- Insert the records
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');


-- Question 


-- Get the count of distint student that are not unique 

select
	count(dup) as dis_uni_stu
from

(select 
	name,
	count(student_id) as dup
from 
	student_names
group by
	1
) as x1
where dup > 1
	









SELECT 
	COUNT(*) as distint_student_cnt
FROM 
	(
	SELECT name,
		COUNT(name) 
	FROM student_names
	GROUP BY name
	HAVING COUNT(name) = 1
	) as subquery
	
	

 
	SELECT name,
			COUNT(name)
	FROM student_names
	GROUP BY name
	HAVING COUNT(name) = 1
	










SELECT 
	COUNT(*) as non_unique
 FROM 
	(
	SELECT 
		name,
		COUNT(name) as cnt
	FROM student_names	
	GROUP BY name
	HAVING COUNT(name) = 1
 	) subquery
