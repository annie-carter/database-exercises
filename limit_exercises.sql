USE 311_data;

-- LIMIT limits he number of return rows
SELECT *
FROM cases 
LIMIT 10;

-- OFFSET lets us skip ahead, used for pagenation of pages
SELECT *
FROM cases
LIMIT 10 OFFSET 10;

-- LIMIT Excercises
-- 1
USE employees
SELECT database ()
SHOW tables;

-- 2
SELECT DISTINCT title 
FROM titles
LIMIT 10;

SELECT DISTINCT last_name
FROM employees
ORDER By last_name DESC
LIMIT 10;
-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, 
-- Zultner, Zucker, Zuberrek, Zschoche,Zongker

-- 3
SELECT DISTINCT first_name, last_name, hire_date
FROM employees
WHERE (hire_date LIKE '199%')
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC
LIMIT 5;
-- Khun Bernini, Elvis Goodrum, Sachar Ghalwash, Moto Siegrist, Ulf Pehl

-- 4
SELECT DISTINCT first_name, last_name, hire_date
FROM employees
WHERE (hire_date LIKE '199%')
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC
LIMIT 5 OFFSET 45;
-- Khun Berninin, ELvis GOodrum, Sachar Ghalwash, Moto Siegrist, Faiza Peek






--

