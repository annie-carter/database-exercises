-- 1 
SHOW DATABASES;
USE employees;
DESCRIBE employees;
-- 1
SELECT *
FROM employees
WHERE first_name OR last_name IN ('Irena', 'Vidya', 'Maya');
-- emp_no 11437, 12013, 15498
-- 2
SELECT *
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
    OR first_name = 'Maya';
    -- emp_no 10200, 10397, 10610. It does not match previous
-- 3
SELECT *
FROM employees
WHERE (first_name = 'Irena'
	OR first_name = 'Vidya'
    OR first_name = 'Maya')
    AND gender = 'M';
    -- employee number of top three 10200,10397,10821
-- 4
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%';
-- 40 unique last names that start with 'E'
-- 5
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%'
	OR last_name LIKE '%E';
-- 167 unique last names that start or end with 'E'
-- 6
SELECT DISTINCT last_name
FROM employees
WHERE last_name NOT LIKE 'E%'
	AND last_name LIKE '%E';
-- 127 last names that start and end with 'E'
-- 7
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%E';
-- 5 last names that start and end with 'E'
-- 8 
SELECT DISTINCT *
FROM employees
WHERE hire_date LIKE '199%';
-- emp_no 10008,10011, 10012
-- 9
SELECT DISTINCT *
FROM employees
WHERE birth_date LIKE '%-12-25';
-- emp_no 10078, 10115, 10261
-- 10 
SELECT DISTINCT *
FROM employees
WHERE (hire_date LIKE '199%')
	AND birth_date LIKE '%-12-25';
-- 362 and emp_no 10261, 10438, 10681
-- 11
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%';
-- 10 names 
-- 12 
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%'
 AND last_name NOT LIKE '%qu%';
 -- there are 3 rows 
 

-- 2 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;
-- 1st Irena Reutenauer & Last Vodya Simmen

-- 3
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;
-- 1st name Irena Acton, Last name Vidya Zweizig

-- 4
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC; 
-- 1st Irena Acton and last Maya Zyda

-- 5
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
	OR last_name LIKE '%E'
ORDER BY emp_no ASC;
-- S 1000 1st- 10021 Ramzi Erdi, Last 19401 Yurij Valiente

-- 6
SELECT  *
FROM employees
WHERE last_name LIKE 'E%'
	OR last_name LIKE '%E'
ORDER BY hire_date ASC;
-- S 1000, Hideyuki Delgranda 2000-01-22, Krassmi Wegerle 1985-01-01

-- 7
SELECT DISTINCT *
FROM employees
WHERE (hire_date LIKE '199%')
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC;
-- 362 returned, Khun Bernini 1999-08-31, Alsem Cappello 1990-01-01

 


    







    

