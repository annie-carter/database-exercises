USE employees;
-- 1
/* Write a query that returns all employees, 
their department number, t
heir start date,
 their end date,
 and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
 DO NOT WORRY ABOUT DUPLICATE EMPLOYEES. */;
 
SELECT emp_no, dept_no, from_date as 'start date', to_date,
	IF (de.to_date > NOW(), 1, 0 )AS 'is_current_employee'
FROM dept_emp de;

-- 2
/* Write a query that returns all employee names
 (previous and current), and a new column 'alpha_group' 
 that returns 'A-H', 'I-Q', or 'R-Z' depending on the first
 letter of their last name. */
 
 SELECT CONCAT(first_name,' ', last_name) as 'Employees Name', 
		CASE 
			WHEN LEFT(last_name, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
            WHEN LEFT(last_name, 1)	BETWEEN	'I' AND 'Q' THEN 'I-Q'
            WHEN LEFT(last_name, 1)	BETWEEN	'R' AND 'Z'	THEN 'R-Z'
        END AS alpha_group
	FROM employees;