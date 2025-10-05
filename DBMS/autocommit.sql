mysql> select * from Students;
+------+-------+
| ID   | Value |
+------+-------+
|    1 |     3 |
|    2 |     4 |
|    3 |     5 |
|    4 |    60 |
|    6 |    90 |
+------+-------+
5 rows in set (0.00 sec)

mysql> delete from Students where ID=1;
Query OK, 1 row affected (0.00 sec)

mysql> select * from Students;
+------+-------+
| ID   | Value |
+------+-------+
|    2 |     4 |
|    3 |     5 |
|    4 |    60 |
|    6 |    90 |
+------+-------+
4 rows in set (0.00 sec)

mysql> set autocommit = off;
Query OK, 0 rows affected (0.01 sec)

mysql> delete from Students where ID=3;
Query OK, 1 row affected (0.00 sec)

mysql> select * from Students;
+------+-------+
| ID   | Value |
+------+-------+
|    2 |     4 |
|    4 |    60 |
|    6 |    90 |
+------+-------+
3 rows in set (0.00 sec)

--Exit to Linux terminal and log in again to mysql

mysql> select * from Students;
+------+-------+
| ID   | Value |
+------+-------+
|    2 |     4 |
|    3 |     5 |
|    4 |    60 |
|    6 |    90 |
+------+-------+
4 rows in set (0.00 sec)

mysql> set autocommit = on;
Query OK, 0 rows affected (0.00 sec)
