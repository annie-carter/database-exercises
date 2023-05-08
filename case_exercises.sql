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
    
    -- 3 How many employees (current or previous) were born in each decade?

   SELECT COUNT(birth_decades)-- CONCAT(first_name,' ', last_name) as 'Employees Name', 
		CASE
			WHEN LEFT(birth_date, 3) = '195' THEN '50s'
			WHEN LEFT(birth_date, 3) = '196' THEN '60s'
        END AS birth_decades
	FROM employees;
    
    /* 4 What is the current average salary for each of the following
    department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR,
    Customer Service? */
    
    SELECT AVG(salary)
		CASE
			WHEN dept_name = 'R&D' AND de.to_date > NOW() THEN 
		END AS 
	FROM salaries s
    JOIN dept_emp de ON s.emp_no = de.emp_no
    JOIN departments d ON de.dept_no =d.dept_no;
    
    
    SELECT CONCAT(first_name,' ', last_name) as 'Employees Name', 
		CASE
			WHEN LEFT(birth_date, 3) = '5' THEN '50s'
			WHEN LEFT(birth_date, 3) = '6' THEN '60s'
			WHEN LEFT(birth_date, 3) = '7' THEN '70s'
        END AS birth_decades
	FROM employees;


/*4 What is the current average salary for each of the following
    department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR,
    Customer Service? */

SELECT *
FROM departments;
SELECT 
    CASE 
        WHEN dept_name IN ('R&D', 'Development', 'Research') THEN 'R&D' 
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
        WHEN dept_name = 'Customer Service' THEN 'Customer Service'
        ELSE 'null'
    END AS department_group,
    ROUND(AVG(salary),2) AS avg_salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date > NOW()
GROUP BY department_group;  

-- BONUS
SELECT DISTINCT de.emp_no, dept_no, from_date as 'start date', to_date,
	IF (de.to_date > NOW(), 1, 0 )AS 'is_current_employee'
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no;



    