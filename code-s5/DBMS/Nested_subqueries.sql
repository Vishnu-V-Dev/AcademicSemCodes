mysql> select * from employee;
+--------+----------+---------+----------+------+
| emp_id | emp_name | dept_id | salary   | age  |
+--------+----------+---------+----------+------+
|    101 | Alice    |       2 | 60000.00 |   28 |
|    102 | Bob      |       2 | 55000.00 |   25 |
|    103 | Charlie  |       3 | 70000.00 |   30 |
|    104 | David    |       1 | 40000.00 |   26 |
|    105 | Eve      |       3 | 72000.00 |   32 |
+--------+----------+---------+----------+------+
5 rows in set (0.00 sec)

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Finance   |
+---------+-----------+
3 rows in set (0.00 sec)

-- 1️⃣ Nested Subquery with IN
-- Employees working in departments that are in IT or Finance
mysql> select emp_name,dept_id from employee
    -> where dept_id IN ( SELECT dept_id
    -> from department where dept_name IN('IT','Finance') );
+----------+---------+
| emp_name | dept_id |
+----------+---------+
| Alice    |       2 |
| Bob      |       2 |
| Charlie  |       3 |
| Eve      |       3 |
+----------+---------+
4 rows in set (0.00 sec)

-- 2️⃣ Nested Subquery with NOT IN
-- Employees NOT in departments with dept_id 3
mysql> select emp_name,dept_id from employee
    -> where dept_id NOT IN ( select dept_id
    -> from department where dept_id = 3 );
+----------+---------+
| emp_name | dept_id |
+----------+---------+
| Alice    |       2 |
| Bob      |       2 |
| David    |       1 |
+----------+---------+
3 rows in set (0.00 sec)

-- 3️⃣ Nested Subquery with Aggregate Function (MAX)
-- Employees having the highest salary
mysql> select emp_name,salary from employee
    -> where salary = ( SELECT MAX(salary) from employee );
+----------+----------+
| emp_name | salary   |
+----------+----------+
| Eve      | 72000.00 |
+----------+----------+
1 row in set (0.00 sec)

-- Employees having the more than AVG salary
mysql> select emp_name,salary from employee
    -> where salary > ( SELECT AVG(salary) from employee );
+----------+----------+
| emp_name | salary   |
+----------+----------+
| Alice    | 60000.00 |
| Charlie  | 70000.00 |
| Eve      | 72000.00 |
+----------+----------+
3 rows in set (0.00 sec)

-- 4️⃣ Nested Subquery with Multiple Conditions
-- Employees in IT or Finance with salary > 60000
mysql> select emp_id,dept_id,salary from employee
    -> where dept_id IN ( select dept_id from department
    -> where dept_name IN ('IT','Finance')
    -> AND salary > 60000);
+--------+---------+----------+
| emp_id | dept_id | salary   |
+--------+---------+----------+
|    103 |       3 | 70000.00 |
|    105 |       3 | 72000.00 |
+--------+---------+----------+
2 rows in set (0.01 sec)

-- Employees in IT with salary > AVG also show name of the employee
mysql> select emp_name,emp_id,dept_id,salary from employee
    -> where dept_id IN ( select dept_id from department
    -> where dept_name IN ('IT')
    -> AND salary > ( SELECT AVG(salary) from employee ) );
+----------+--------+---------+----------+
| emp_name | emp_id | dept_id | salary   |
+----------+--------+---------+----------+
| Alice    |    101 |       2 | 60000.00 |
+----------+--------+---------+----------+
1 row in set (0.00 sec)
