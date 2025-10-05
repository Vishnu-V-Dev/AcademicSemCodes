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
11 rows in set (0.00 sec)

mysql> use DB1;
Database changed

mysql> show tables;
+---------------+
| Tables_in_DB1 |
+---------------+
| Employee      |
+---------------+
1 row in set (0.00 sec)

--Backup of Multiple Databases
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| CompanyDB          |
| DB1                |
| DB2                |
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
12 rows in set (0.01 sec)

[In Linux  Shell Termnal]:~$ sudo mysqldump -u root -p --databases DB1 DB2 > multi_db_backup.sql

mysql> drop database DB1;
Query OK, 1 row affected (0.07 sec)

mysql> drop database DB2;
Query OK, 0 rows affected (0.02 sec)

mysql> show databases;
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
10 rows in set (0.00 sec)

[In Linux  Shell Termnal]:~$ sudo mysql -u root -p < multi_db_backup.sql

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| CompanyDB          |
| DB1                |
| DB2                |
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
12 rows in set (0.00 sec)

--Backup of All Databases available
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| CompanyDB          |
| DB1                |
| DB2                |
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
12 rows in set (0.00 sec)

[In Linux  Shell Termnal]:~$ sudo mysqldump -u root -p --all-databases > all_db_backup.sql

  --Drop any or all Database(s)
[In Linux  Shell Termnal]:~$ sudo mysql -u root -p -e "DROP DATABASE CompanyDB; DROP DATABASE DB1; DROP DATABASE DB2; DROP DATABASE ExampleDB; DROP DATABASE SchoolDB; DROP DATABASE ShopDB;"

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| LabDB              |
| SmallJoinDB        |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

[In Linux  Shell Termnal]:~$ sudo mysql -u root -p < all_db_backup.sql

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| CompanyDB          |
| DB1                |
| DB2                |
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
12 rows in set (0.00 sec)
