USE quintela_2244;

-- 1
CREATE TEMPORARY TABLE quintela_2244.employees_with_departments AS 
(SELECT first_name, last_name, dept_name
FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no);


SELECT *
FROM employees_with_departments;
-- 1a 

SELECT *
FROM employees_with_departments;
ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);
-- first_name VAR(14), VARCHAR(1) ' ' last_name VARCHAR (16)



-- 1b
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

-- 1c
ALTER TABLE employees_with_departments 
DROP COLUMN first_name,
DROP COLUMN last_name;


