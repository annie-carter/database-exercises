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
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- over 1000
-- 12 
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
 AND last_name NOT LIKE '%qu%';
 -- there are 547 rows 





    

