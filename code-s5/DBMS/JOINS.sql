mysql> select * from employee;
+--------+----------+---------+
| emp_id | emp_name | dept_id |
+--------+----------+---------+
|    101 | Alice    |       2 |
|    102 | Bob      |       2 |
|    103 | Charlie  |       1 |
|    104 | David    |    NULL |
+--------+----------+---------+
4 rows in set (0.00 sec)

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
+---------+-----------+
2 rows in set (0.00 sec)

mysql> -- INNER JOIN
mysql> select e.emp_name,d.dept_name
    -> from employee e
    -> INNER JOIN department d ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Alice    | IT        |
| Bob      | IT        |
| Charlie  | HR        |
+----------+-----------+
3 rows in set (0.00 sec)

mysql> -- LEFT JOIN
mysql> select e.emp_name,d.dept_name
    -> from employee e
    -> LEFT JOIN department d ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Alice    | IT        |
| Bob      | IT        |
| Charlie  | HR        |
| David    | NULL      |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> -- RIGHT JOIN
mysql> select e.emp_name,d.dept_name
    -> from employee e
    -> RIGHT JOIN department d ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Charlie  | HR        |
| Bob      | IT        |
| Alice    | IT        |
+----------+-----------+
3 rows in set (0.00 sec)

mysql> -- NATURAL JOIN
mysql> select emp_name,dept_name
    -> from employee
    -> NATURAL JOIN department;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Alice    | IT        |
| Bob      | IT        |
| Charlie  | HR        |
+----------+-----------+
3 rows in set (0.00 sec)

1️⃣ INNER JOIN
-> You explicitly specify the column(s) to join on using ON.
-> Only returns rows where the join condition matches in both tables.
-> You have full control over which columns are used for the join.

2️⃣ NATURAL JOIN
-> Automatically joins tables on all columns with the same name in both tables.
-> You do not specify the join column.
-> Can be risky if there are multiple columns with the same name that you didn’t intend to join.
