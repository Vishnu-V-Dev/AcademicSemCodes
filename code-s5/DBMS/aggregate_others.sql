-- 1. Show all tables in the current database
mysql> show tables;
+-------------------+
| Tables_in_DB2     |
+-------------------+
| employee          |
+-------------------+
1 row in set (0.01 sec)

-- 2. Describe the `employee` table structure
mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | YES  |     | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

-- 3. Add a primary key to the `ID` column
mysql> alter table employee add primary key(ID);
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- 4. Describe the table again after adding the primary key
mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | NO   | PRI | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

-- 5. Add a new column `new` of type int
mysql> alter table employee add new int;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- 6. Describe the table after adding the new column
mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | NO   | PRI | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
| new    | int           | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

-- 7. Insert sample data into the `employee` table
mysql> INSERT INTO employee (ID, Name, Dept, Salary, new) VALUES
(1, 'John', 'Sales', 50000.00, 1),
(2, 'Jane', 'Sales', 60000.00, 2),
(3, 'Alice', 'HR', 55000.00, 3),
(4, 'Bob', 'IT', 70000.00, 4),
(5, 'Charlie', 'IT', 75000.00, 5),
(6, 'David', 'HR', 80000.00, 6);
Query OK, 6 rows affected (0.03 sec)

-- 8. Select all data from `employee` table
mysql> SELECT * FROM employee;
+----+---------+---------+--------+------+
| ID | Name    | Dept    | Salary | new  |
+----+---------+---------+--------+------+
|  1 | John    | Sales   | 50000.00 | 1    |
|  2 | Jane    | Sales   | 60000.00 | 2    |
|  3 | Alice   | HR      | 55000.00 | 3    |
|  4 | Bob     | IT      | 70000.00 | 4    |
|  5 | Charlie | IT      | 75000.00 | 5    |
|  6 | David   | HR      | 80000.00 | 6    |
+----+---------+---------+--------+------+
6 rows in set (0.01 sec)

-- 9. Aggregate Function Examples

-- COUNT() - Count total number of employees
mysql> SELECT COUNT(*) AS total_employees FROM employee;
+-----------------+
| total_employees |
+-----------------+
|               6 |
+-----------------+
1 row in set (0.00 sec)

-- SUM() - Calculate total salary of all employees
mysql> SELECT SUM(Salary) AS total_salary FROM employee;
+-------------+
| total_salary |
+-------------+
| 340000.00   |
+-------------+
1 row in set (0.00 sec)

-- AVG() - Find the average salary of employees
mysql> SELECT AVG(Salary) AS avg_salary FROM employee;
+------------+
| avg_salary |
+------------+
| 56666.6667 |
+------------+
1 row in set (0.00 sec)

-- MAX() - Find the highest salary
mysql> SELECT MAX(Salary) AS highest_salary FROM employee;
+---------------+
| highest_salary |
+---------------+
| 80000.00      |
+---------------+
1 row in set (0.00 sec)

-- MIN() - Find the lowest salary
mysql> SELECT MIN(Salary) AS lowest_salary FROM employee;
+--------------+
| lowest_salary |
+--------------+
| 50000.00     |
+--------------+
1 row in set (0.00 sec)

-- GROUP_CONCAT() - Concatenate employee names in 'IT' department
mysql> SELECT Dept, GROUP_CONCAT(Name ORDER BY Name) AS employees_in_IT 
       FROM employee WHERE Dept = 'IT' GROUP BY Dept;
+--------+-------------------+
| Dept   | employees_in_IT    |
+--------+-------------------+
| IT     | Bob,Charlie       |
+--------+-------------------+
1 row in set (0.00 sec)

-- 10. Additional Operations

-- GROUP BY - Group by department and calculate the sum of salaries for each department
mysql> SELECT Dept, SUM(Salary) AS total_salary_by_dept
       FROM employee GROUP BY Dept;
+--------+--------------------+
| Dept   | total_salary_by_dept |
+--------+--------------------+
| HR     | 135000.00          |
| IT     | 145000.00          |
| Sales  | 110000.00          |
+--------+--------------------+
3 rows in set (0.00 sec)

-- HAVING - Filter departments where total salary is greater than 120,000
mysql> SELECT Dept, SUM(Salary) AS total_salary_by_dept
       FROM employee GROUP BY Dept HAVING total_salary_by_dept > 120000;
+--------+--------------------+
| Dept   | total_salary_by_dept |
+--------+--------------------+
| IT     | 145000.00          |
+--------+--------------------+
1 row in set (0.00 sec)

-- 11. Clean Up: Drop the `employee` table
mysql> DROP TABLE employee;
Query OK, 0 rows affected (0.03 sec)
