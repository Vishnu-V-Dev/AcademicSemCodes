mysql> select *from Test;
+------+-------+
| Name | Value |
+------+-------+
| Ryan |   100 |
| Kira |   220 |
| Zoe  |   333 |
+------+-------+
3 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into Test values("Paul",400);
Query OK, 1 row affected (0.00 sec)

mysql> delete from Test where Value=100;
Query OK, 1 row affected (0.00 sec)

mysql> select *from Test;
+------+-------+
| Name | Value |
+------+-------+
| Kira |   220 |
| Zoe  |   333 |
| Paul |   400 |
+------+-------+
3 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select *from Test;
+------+-------+
| Name | Value |
+------+-------+
| Ryan |   100 |
| Kira |   220 |
| Zoe  |   333 |
+------+-------+
3 rows in set (0.00 sec)

mysql> insert into Test values("Ryan", 100),("Kira", 220),("Zoe", 333);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select *from Test;
+------+-------+
| Name | Value |
+------+-------+
| Paul |   400 |
| Hana |   550 |
| Eiji |   666 |
| Ryan |   100 |
| Kira |   220 |
| Zoe  |   333 |
+------+-------+
6 rows in set (0.01 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> savepoint save1;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from Test where Name="Zoe";
Query OK, 1 row affected (0.00 sec)

mysql> select *from Test;
+------+-------+
| Name | Value |
+------+-------+
| Paul |   400 |
| Hana |   550 |
| Eiji |   666 |
| Ryan |   100 |
| Kira |   220 |
+------+-------+
5 rows in set (0.00 sec)

mysql> rollback to save1;
Query OK, 0 rows affected (0.00 sec)

mysql> select *from Test;
+------+-------+
| Name | Value |
+------+-------+
| Paul |   400 |
| Hana |   550 |
| Eiji |   666 |
| Ryan |   100 |
| Kira |   220 |
| Zoe  |   333 |
+------+-------+
6 rows in set (0.00 sec)
