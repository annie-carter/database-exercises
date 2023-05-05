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
SELECT *
FROM employees
WHERE emp_no = (
	SELECT emp_no
    FROM dept_manager
	WHERE to_date > NOW（）
    );
    CONCAT(first_name,' ',last_name) AS 'Current Department Manager', gender
FROM (
	SELECT emp_no, first_
WHERE emp_no 
;

-- 5
SELECT emp_no, salary
FROM salaries s
JOIN employees 



-- 6 
SELECT STDDEV(salary)
FROM salaries
WHERE to_date> now();


SELECT count(*)
FROM salaries
WHERE to_date> now()
AND salary
SELECT MAX(salary) FROM salaries WHERE to_date > now()) -
(SELECT STD(salary) FROM salaries WHERE to_date> now())))
(SELECT count (*)
FROM salaries
WHERE to_date > now())) * 100 AS '% of salaries with STD';
        
