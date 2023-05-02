-- 3
SHOW DATABASES;

-- 4
USE albums_db;
-- 5
SELECT DATABASE ();
-- #when using SELECT DATABASE remember open close paranthesis
-- 6
SHOW TABLES;
-- 7
USE employees;

-- 8
SELECT DATABASE ();
-- 9
SHOW TABLES;
-- 10
SHOW CREATE DATABASE employees;
-- 11 shows employee information
SHOW TABLES;  
-- 12 dept_manager, dept_emp etc., would 
-- have string type columns because they are 
-- CHAR and VARCHAR TEXT
-- 13 salaries would have the data types
-- 14 There is no relationship between the employee and department tqbles. 
DESCRIBE employees;
DESCRIBE departments; 
-- 15  
SHOW CREATE TABLE dept_manager;
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1