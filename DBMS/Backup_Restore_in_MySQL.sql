--Backup of a Single Database
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| CompanyDB          |
| DB1                |
| ExampleDB          |
| LabDB              |
| SchoolDB           |
| ShopDB             |
| SmallJoinDB        |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
11 rows in set (0.02 sec)

[In Linux  Shell Termnal]:~$ sudo mysqldump -u root -p DB1 > backup01.sql

mysql> drop database DB1;
Query OK, 1 row affected (0.09 sec)

mysql> show databases; --Dropped DB1
+--------------------+
| Database           |
+--------------------+
| CompanyDB          |
| ExampleDB          |
| LabDB              |
| SchoolDB           |
| ShopDB             |
| SmallJoinDB        |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
10 rows in set (0.01 sec)

mysql> create database DB1;
Query OK, 1 row affected (0.03 sec)

[In Linux  Shell Termnal]:~$ sudo mysql -u root -p DB1 < backup01.sql --backup done

--Backup of Multiple Databases
