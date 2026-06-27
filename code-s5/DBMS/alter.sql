mysql> create table employee(ID int,Name char(20), Dept varchar(15), Salary decimal(10,2));
Query OK, 0 rows affected (0.10 sec)

mysql> show tables;
+---------------+
| Tables_in_DB2 |
+---------------+
| employee      |
+---------------+
1 row in set (0.01 sec)

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

mysql> alter table employee add primary key(ID);
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

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

mysql> alter table employee add new int;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

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

mysql> alter table employee drop column new;
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | NO   | PRI | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table employee drop primary key;
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | NO   |     | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table employee modify column ID int NULL;
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | YES  |     | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table employee modify column ID varchar(30) NULL;
Query OK, 0 rows affected (0.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | varchar(30)   | YES  |     | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> alter table employee modify column ID int not NULL;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | NO   |     | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table employee add primary key(ID);
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| ID     | int           | NO   | PRI | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> rename table employee to Emp;
Query OK, 0 rows affected (0.07 sec)

mysql> alter table Emp change ID E_ID int;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Emp;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| E_ID   | int           | NO   | PRI | NULL    |       |
| Name   | char(20)      | YES  |     | NULL    |       |
| Dept   | varchar(15)   | YES  |     | NULL    |       |
| Salary | decimal(10,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
