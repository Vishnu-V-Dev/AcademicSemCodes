-- 🔹 STRING FUNCTIONS
SELECT CONCAT('John', ' earns $', 50000) AS details;
-- Output: John earns $50000

SELECT LENGTH('Alice') AS name_length;
-- Output: 5

SELECT UPPER('bob') AS uppercase_name;
-- Output: BOB

SELECT LOWER('JANE') AS lowercase_name;
-- Output: jane

SELECT REVERSE('Hello') AS reversed_text;
-- Output: olleH

-- 🔹 NUMERIC FUNCTIONS
SELECT ABS(-123) AS absolute_value;
-- Output: 123

SELECT ROUND(456.789, 2) AS rounded_value;
-- Output: 456.79

SELECT FORMAT(9876543.21, 2) AS formatted_value;
-- Output: 9,876,543.21

-- 🔹 DATE FUNCTIONS
SELECT NOW() AS current_datetime;
-- Output example: 2025-10-05 18:45:00

SELECT CURDATE() AS current_date;
-- Output example: 2025-10-05

SELECT YEAR('2017-03-22') AS year_part;
-- Output: 2017

SELECT MONTH('2017-03-22') AS month_part;
-- Output: 3

SELECT DATEDIFF(CURDATE(), '2017-03-22') AS days_diff;
-- Output example: 3111

-- 🔹 CONDITIONAL FUNCTIONS
SELECT IF(75000>60000, 'High', 'Low') AS salary_status;
-- Output: High

SELECT COALESCE(NULL, 0, 123) AS first_non_null;
-- Output: 0

-- 🔹 MISCELLANEOUS FUNCTIONS
SELECT DATABASE() AS db_name;
-- Output example: CompanyDB

SELECT USER() AS current_user;
-- Output example: root@localhost

SELECT STRCMP('abc','abd') AS cmp_result;
-- Output: -1

SELECT LCASE('HELLO') AS lower_text;
-- Output: hello

SELECT UCASE('hello') AS upper_text;
-- Output: HELLO

SELECT CONV('15',10,2) AS binary_val;
-- Output: 1111

SELECT CONV('A',16,10) AS decimal_val;
-- Output: 10

SELECT CONCAT('Hi',' ','All') AS greeting;
-- Output: Hi All

SELECT REVERSE('MySQL') AS reversed_mysql;
-- Output: LQSyM
