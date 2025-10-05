-- 1️⃣ Create Database (optional)
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- 2️⃣ Create Sample Table
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- 3️⃣ Insert Sample Data
INSERT INTO employee (name, salary, hire_date) VALUES
('John Doe', 50000.00, '2015-06-25'),
('Jane Smith', 62000.50, '2016-07-14'),
('Alice Johnson', 75000.00, '2017-03-22'),
('Bob Brown', 45000.00, '2018-08-19');

-- ==========================================================
-- 🔹 STRING FUNCTIONS
-- ==========================================================

-- CONCAT(): Combine name and salary
SELECT CONCAT(name, ' - Salary: $', salary) AS employee_details FROM employee;
/*
Expected Output:
+-----------------------------------+
| employee_details                  |
+-----------------------------------+
| John Doe - Salary: $50000.00      |
| Jane Smith - Salary: $62000.50    |
| Alice Johnson - Salary: $75000.00 |
| Bob Brown - Salary: $45000.00     |
+-----------------------------------+
*/

-- LENGTH(): Get the length of a name
SELECT name, LENGTH(name) AS name_length FROM employee;
/*
+--------------+-------------+
| name         | name_length |
+--------------+-------------+
| John Doe     | 8           |
| Jane Smith   | 10          |
| Alice Johnson| 14          |
| Bob Brown    | 9           |
+--------------+-------------+
*/

-- UPPER(): Convert to uppercase
SELECT name, UPPER(name) AS uppercase_name FROM employee;
/*
| name          | uppercase_name |
|----------------|----------------|
| John Doe      | JOHN DOE       |
| Jane Smith    | JANE SMITH     |
| Alice Johnson | ALICE JOHNSON  |
| Bob Brown     | BOB BROWN      |
*/

-- LOWER(): Convert to lowercase
SELECT name, LOWER(name) AS lowercase_name FROM employee;
/*
| name          | lowercase_name |
|----------------|----------------|
| John Doe      | john doe       |
| Jane Smith    | jane smith     |
| Alice Johnson | alice johnson  |
| Bob Brown     | bob brown      |
*/

-- REVERSE(): Reverse name string
SELECT name, REVERSE(name) AS reversed_name FROM employee;
/*
| name          | reversed_name |
|----------------|----------------|
| John Doe      | eoD nhoJ      |
| Jane Smith    | htimS enaJ    |
| Alice Johnson | nosnhoJ ecilA |
| Bob Brown     | nworB boB     |
*/

-- ==========================================================
-- 🔹 NUMERIC FUNCTIONS
-- ==========================================================

-- ABS(): Absolute value
SELECT salary, ABS(salary) AS absolute_salary FROM employee;
/*
| salary   | absolute_salary |
|-----------|-----------------|
| 50000.00  | 50000.00        |
| 62000.50  | 62000.50        |
| 75000.00  | 75000.00        |
| 45000.00  | 45000.00        |
*/

-- ROUND(): Round to 2 decimal places
SELECT salary, ROUND(salary, 2) AS rounded_salary FROM employee;
/*
Same output as salary since all have 2 decimals
*/

-- FORMAT(): Format with commas
SELECT salary, FORMAT(salary, 2) AS formatted_salary FROM employee;
/*
| salary   | formatted_salary |
|-----------|------------------|
| 50000.00  | 50,000.00        |
| 62000.50  | 62,000.50        |
| 75000.00  | 75,000.00        |
| 45000.00  | 45,000.00        |
*/

-- ==========================================================
-- 🔹 DATE FUNCTIONS
-- ==========================================================

-- NOW(): Current date and time
SELECT NOW() AS current_datetime;
/*
| current_datetime     |
|----------------------|
| 2025-10-05 18:20:00  |
*/

-- CURDATE(): Current date
SELECT CURDATE() AS current_date;
/*
| current_date |
|---------------|
| 2025-10-05    |
*/

-- YEAR(): Extract year from hire_date
SELECT name, YEAR(hire_date) AS hire_year FROM employee;
/*
| name          | hire_year |
|----------------|-----------|
| John Doe      | 2015      |
| Jane Smith    | 2016      |
| Alice Johnson | 2017      |
| Bob Brown     | 2018      |
*/

-- MONTH(): Extract month from hire_date
SELECT name, MONTH(hire_date) AS hire_month FROM employee;
/*
| name          | hire_month |
|----------------|------------|
| John Doe      | 6          |
| Jane Smith    | 7          |
| Alice Johnson | 3          |
| Bob Brown     | 8          |
*/

-- DATEDIFF(): Days between hire_date and today
SELECT name, DATEDIFF(CURDATE(), hire_date) AS days_since_hired FROM employee;
/*
| name          | days_since_hired |
|----------------|------------------|
| John Doe      | 3759             |
| Jane Smith    | 3404             |
| Alice Johnson | 3111             |
| Bob Brown     | 2589             |
*/

-- ==========================================================
-- 🔹 AGGREGATE FUNCTIONS
-- ==========================================================

SELECT COUNT(*) AS total_employees FROM employee;
/*
| total_employees |
|-----------------|
| 4               |
*/

SELECT SUM(salary) AS total_salary FROM employee;
/*
| total_salary |
|---------------|
| 234000.50    |
*/

SELECT AVG(salary) AS average_salary FROM employee;
/*
| average_salary |
|----------------|
| 58500.125      |
*/

SELECT MAX(salary) AS highest_salary FROM employee;
/*
| highest_salary |
|----------------|
| 75000.00       |
*/

SELECT MIN(salary) AS lowest_salary FROM employee;
/*
| lowest_salary |
|----------------|
| 45000.00       |
*/

-- ==========================================================
-- 🔹 CONDITIONAL FUNCTIONS
-- ==========================================================

SELECT name, IF(salary > 60000, 'High Salary', 'Low Salary') AS salary_status FROM employee;
/*
| name          | salary_status |
|----------------|----------------|
| John Doe      | Low Salary     |
| Jane Smith    | High Salary    |
| Alice Johnson | High Salary    |
| Bob Brown     | Low Salary     |
*/

SELECT name, COALESCE(salary, 0) AS salary_or_zero FROM employee;
/*
| name          | salary_or_zero |
|----------------|----------------|
| John Doe      | 50000.00       |
| Jane Smith    | 62000.50       |
| Alice Johnson | 75000.00       |
| Bob Brown     | 45000.00       |
*/

-- ==========================================================
-- 🔹 MISCELLANEOUS BUILT-IN FUNCTIONS
-- ==========================================================

SELECT DATABASE() AS current_database;  -- CompanyDB
SELECT USER() AS current_user;          -- root@localhost

SELECT STRCMP('abc', 'abc') AS cmp_equal;     -- 0
SELECT STRCMP('abc', 'abd') AS cmp_less;      -- -1
SELECT STRCMP('xyz', 'abc') AS cmp_greater;   -- 1

SELECT LCASE('HELLO') AS lowercase_text;      -- hello
SELECT UCASE('hello') AS uppercase_text;      -- HELLO

SELECT CONV('15', 10, 2) AS decimal_to_binary; -- 1111
SELECT CONV('A', 16, 10) AS hex_to_decimal;    -- 10

SELECT CONCAT('Hello', ' ', 'World') AS hello_world; -- Hello World
SELECT REVERSE('MySQL') AS reversed_mysql;           -- LQSyM

-- ==========================================================
-- 🔹 CLEAN-UP (Optional)
-- ==========================================================

DROP TABLE employee;

