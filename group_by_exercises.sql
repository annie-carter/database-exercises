-- Created group_by_exercises.sql

-- 2
SELECT DISTINCT COUNT(title)
FROM titles;

-- 3 
SELECT last_name
FROM employees
WHERE last_name LIKE '%E%'
GROUP BY last_name;

-- 4
SELECT first_name,last_name 
FROM employees
WHERE first_name LIKE '%E%' AND last_name LIKE '%E%'
Group by first_name, last_name;

-- 5
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
Group by last_name;

-- 6
SELECT last_name, COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
Group by last_name;
-- Chelq 189, Lindqvist 190, Qiwen 168

-- 7
SELECT first_name, gender, COUNT(gender)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

-- 8
SELECT 
    LOWER(
        CONCAT(
            SUBSTR(first_name, 1, 1),
            SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)))
            AS username,
	COUNT(*)
		AS same_username
FROM employees
GROUP BY username
HAVING same_username > 1;

-- 9
SELECT 
    LOWER(
        CONCAT(
            SUBSTR(first_name, 1, 1),
            SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)))
            AS username,
	COUNT(*)
		AS same_username
FROM employees
GROUP BY username
HAVING same_username > 1
ORDER BY same_username DESC;
-- 6 is the highest number of times a user name 

-- BONUS
SELECT COUNT(*) AS Duplicate_usernames
FROM (SELECT 
		LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1),
				SUBSTR(last_name, 1, 4),
				'_',
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)))
				AS username,
		COUNT(*)
			AS same_username
	FROM employees
	GROUP BY username
	HAVING same_username > 1
	ORDER BY same_username DESC) AS SUBQUERY;
    



