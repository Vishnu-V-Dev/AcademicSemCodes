mysql> select * from Employees;
+--------+-------------+---------+
| emp_id | name        | salary  |
+--------+-------------+---------+
|      1 | John Doe    | 5000.00 |
|      2 | Jane Smith  | 6000.00 |
|      3 | Alice Brown | 7000.00 |
+--------+-------------+---------+
3 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE Employees SET salary = 5500.00 WHERE emp_id = 1;
mployees SET salary = 6500.00 WHERE emp_id = 2;Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Employees SET salary = 6500.00 WHERE emp_id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT savepoint1;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE Employees SET salary = 8000.00 WHERE emp_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ROLLBACK TO SAVEPOINT savepoint1;
Query OK, 0 rows affected (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Employees;
+--------+-------------+---------+
| emp_id | name        | salary  |
+--------+-------------+---------+
|      1 | John Doe    | 5500.00 |
|      2 | Jane Smith  | 6500.00 |
|      3 | Alice Brown | 7000.00 |
+--------+-------------+---------+
3 rows in set (0.00 sec)
