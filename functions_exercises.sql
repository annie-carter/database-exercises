--  FUNCTIONS - preset list of instructions to execute a task. 
-- Numeric Functions: AVG = mean MIN= minimum value MAX = Maximum value 
USE farmers_market;

SELECT*
FROM customer_purchases;

SELECT AVG (quantity)
FROM customer_purchases;

SELECT AVG(quantity), MIN(quantity), MAX(quantity)
FROM customer_purchases;

-- STRING DATA 
-- CONCAT -- stick together

SELECT customer_first_name, 
 customer_last_name, 
 CONCAT(customer_first_name, ' ', customer_last_name) AS customer_full_name
FROM customer;

-- SUBSTR -- substract from the string
-- 1 column to exec 2 where to start 3 # of charaters /where to stop

SELECT product_name, SUBSTR(product_name, 1, 10)
FROM products;

-- UPPER & LOWER
SELECT customer_first_name, UPPER(customer_fist_name), LOWER(customer_first_name)
FROM customer;

-- REPLACE
-- SELECT what you want to replace
SELECT product_size, REPlaCE(product_size, 'medium', 'M')
FROM product;

-- DATE functions 
SELECT NOW ();
-- get datetime for right now
SELECT CURDATE();
-- Get the date for right now
SELECT CURTIME();
-- Get the time for right now

SELECT unix_timestamp('2023-05-03');

-- CASTING
SELECT 2 + '2';
-- SQL will do it Python will NOT
SELECT CONCAT




-- FUNCTION EXECISES
-- 1

-- 2 SELECT  *
USE employees;


select concat(first_name, ' ', last_name) as full_name from employees
where first_name like 'E%E';

-- 3

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name 
FROM employees
where first_name like 'E%E';

-- 4
SELECT COUNT(UPPER(CONCAT(first_name, ' ', last_name))) AS full_name
FROM employees
where last_name like 'E%E';
-- 899 

-- 5 
SELECT DISTINCT first_name, last_name, hire_date, datediff(NOW(),hire_date) AS time_at_company
FROM employees
WHERE (hire_date LIKE '199%')
	AND birth_date LIKE '%-12-25';
    
-- 6
SELECT MIN(salary), MAX(salary) 
FROM salaries;
-- MIN 38623 MAX 158220

-- 7
SELECT 
    LOWER(
        CONCAT(
            SUBSTR(first_name, 1, 1),
            SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
        )
    ) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees
LIMIT 10;

