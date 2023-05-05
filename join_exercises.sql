-- Indexes Exercises
-- 1 
USE employees;
DESCRIBE employees;
-- emp_no is pri keys


-- ---- Join Exercises
-- 1
USE join_example_db;

SELECT*
FROM users;
DESCRIBE users;
SHOW CREATE TABLE users;
/* CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 
*/

SELECT*
FROM roles;
DESCRIBE roles;
SHOW CREATE TABLE roles;
/*CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1
*/

SELECT *
FROM users u
JOIN roles r ON r.id = u.role_id;

SELECT * 
FROM users u
LEFT JOIN roles r ON r.id = u.role_id;

SELECT *
FROM users u
RIGHT JOIN roles r ON r.id = u.role_id;

-- 3

/* Use count and the appropriate join type to get a 
list of roles along with the number of users that has 
the role. Hint: You will also need to use group by in 
the query.
*/
SELECT r.name, COUNT(*) as num_users 
FROM users u
RIGHT JOIN roles r ON u.role_id = r.id
GROUP BY r.name;

-- EMPLOYEE DATABASE

-- 1 
USE employees;

-- 2 
SHOW CREATE TABLE employees;
/* write a query that shows each department along 
with the name of the current manager for that
 department.
*/

SELECT d.dept_name AS Department_Name, CONCAT(em.first_name," ", em.last_name) AS Department_Manager
FROM departments d
	JOIN dept_manager dm ON d.dept_no = dm.dept_no
	JOIN employees em ON dm.emp_no = em.emp_no
	JOIN titles t ON t.emp_no = dm.emp_no
WHERE t.to_date > NOW()
	AND dm.to_date > NOW()
ORDER BY d.dept_name;

-- 3
SELECT d.dept_name AS Department_Name, CONCAT(em.first_name," ", em.last_name) AS Manager_Name
FROM departments d
	JOIN dept_manager dm ON d.dept_no = dm.dept_no
	JOIN employees em ON dm.emp_no = em.emp_no
	JOIN titles t ON t.emp_no = dm.emp_no
WHERE t.to_date > NOW() 
	AND em.gender LIKE 'F';

-- 4
SELECT t.Title, COUNT(t.emp_no) AS Count
FROM titles t
	JOIN dept_emp de ON t.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service' 
	AND t.to_date > NOW()
    AND de.to_date > NOW()
GROUP BY t.title;

-- 5
SELECT d.dept_name AS Department_Name, CONCAT(em.first_name," ", em.last_name) AS Name, s.salary AS Salary
FROM departments d
	JOIN dept_manager dm ON d.dept_no = dm.dept_no
    JOIN employees em ON dm.emp_no = em.emp_no
    JOIN titles t ON t.emp_no = dm.emp_no
    JOIN salaries s ON dm.emp_no = s.emp_no
WHERE s.to_date > NOW()
	AND t.to_date > NOW()
    AND dm.to_date > NOW()
ORDER BY d.dept_name;

-- 6
SELECT d.dept_no, d.dept_name, COUNT(de.emp_no) AS num_employees
FROM departments d
	JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE de.to_date > NOW()
GROUP BY d.dept_no;

-- 7
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments d
	JOIN dept_emp de ON d.dept_no = de.dept_no
    JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date > NOW()
	AND s.to_date > NOW()
GROUP BY d.dept_name
ORDER BY MAX(s.salary) DESC 
LIMIT 1;

-- 8
SELECT e.first_name, e.last_name
FROM departments d
	JOIN dept_emp de ON d.dept_no = de.dept_no
    JOIN salaries s ON de.emp_no = s.emp_no
    JOIN employees e ON s.emp_no = e.emp_no
WHERE d.dept_name = 'Marketing'
	AND s.to_date > NOW()
    AND de.to_date > NOW()
GROUP BY e.first_name, e.last_name
ORDER BY MAX(s.salary) DESC
LIMIT 1;

-- 9
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM departments d
	JOIN dept_manager dm ON d.dept_no = dm.dept_no
    JOIN salaries s ON dm.emp_no = s.emp_no
    JOIN employees e ON s.emp_no = e.emp_no
WHERE s.to_date > NOW()
	AND dm.to_date > NOW()
GROUP BY e.first_name, e.last_name, s.salary, d.dept_name
ORDER BY MAX(s.salary) DESC
LIMIT 1;

-- 10
SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM departments d
	JOIN dept_emp de ON d.dept_no = de.dept_no
    JOIN salaries s ON de.emp_no = s.emp_no
    JOIN employees e ON s.emp_no = e.emp_no
    -- JOIN dept_manager dm ON s.emp_no = dm.emp_no
WHERE de.to_date < NOW()
-- s.to_date < NOW()
	-- AND de.to_date < NOW()
    -- AND dm.to_date < NOW()
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;

-- BONUS
