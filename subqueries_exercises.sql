USE employees;
-- 1
SELECT CONCAT(first_name,' ', last_name) AS 'Current Employees', hire_date
FROM employees e
	JOIN dept_emp de USING (emp_no)
WHERE hire_date = (
	SELECT hire_date 
	FROM employees
	WHERE emp_no = 101010
    -- ORDER BY first_name ASC didn' work here
	)
    AND de.to_date > NOW()
ORDER BY e.first_name ASC;

-- 2
SELECT CONCAT(first_name,' ', last_name) AS 'All Aamods', t.title
FROM employees e
	JOIN titles t USING (emp_no)
WHERE first_name = 'Aamod' /*  GARBAGE; REDUNDANT = ( 
	SELECT first_name
    FROM employees
    WHERE first_name LIKE 'Aamod'*/
    AND t.to_date >NOW()
    ORDER BY t.title ASC;
    
-- 3
    -- SELECT CONCAT(first_name,' ',last_name) AS 'No Longer Working', COUNT(e.emp_no)
SELECT COUNT(*) AS 'No Longer Working'
FROM (
	SELECT emp_no
    FROM dept_emp -- title
	GROUP BY emp_no
	HAVING MAX(to_date) < NOW()
	) squery; -- anytime subquery in from MUST alias
    -- answer is 59900 

-- 4
SELECT CONCAT(e.first_name,' ',e.last_name) AS 'Current Female Managers'
FROM employees e
WHERE e.gender = 'F'
		AND  e.emp_no IN (SELECT dm.emp_no
						FROM dept_manager AS dm
                        WHERE dm.to_date > NOW())
ORDER BY e.first_name;
						


-- 5
SELECT CONCAT(e.first_name,' ',e.last_name) AS 'Current Emp Above AVG Salary', s.salary
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date > NOW()
	AND s.salary > (SELECT AVG(salary)
					FROM salaries s
					WHERE s.to_date < NOW())
			ORDER BY s.salary ASC;
            




-- 6 
/* SELECT COUNT(*) -- CONCAT(e.first_name,' ',e.last_name) AS 'Current Emp Above AVG Salary', s.salary
FROM salaries s 
WHERE s.to_date > NOW()
	AND s.salary > ((SELECT MAX(salary) FROM salaries s WHERE s.to_date < NOW()) -
	(SELECT STD(salary) FROM salaries WHERE to_date > now)) as salary_STD;*/
            
      SELECT COUNT(*)
FROM salaries s 
WHERE s.to_date > NOW()
	AND s.salary > ((SELECT MAX(salary) FROM salaries s WHERE s.to_date > NOW()) -
	(SELECT STD(salary) FROM salaries WHERE to_date > NOW()));      



