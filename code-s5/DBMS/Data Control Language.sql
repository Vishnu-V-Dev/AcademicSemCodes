mysql> select * from Employees;
+--------+-------------+---------+
| emp_id | name        | salary  |
+--------+-------------+---------+
|      1 | John Doe    | 5000.00 |
|      2 | Jane Smith  | 6000.00 |
|      3 | Alice Brown | 7000.00 |
+--------+-------------+---------+
3 rows in set (0.00 sec)

mysql> -- Create an 'admin' user with all privileges
mysql> CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';
Query OK, 0 rows affected (0.01 sec)

mysql> -- Create a 'guest' user with a restricted set of privileges
mysql> CREATE USER 'guest'@'localhost' IDENTIFIED BY 'guest_password';
Query OK, 0 rows affected (0.01 sec)

mysql> -- Grant SELECT and INSERT privileges on Employees table to 'guest'
mysql> GRANT SELECT, INSERT ON Employees TO 'guest'@'localhost';
Query OK, 0 rows affected (0.01 sec)

mysql> -- Grant ALL privileges on the Employees table to 'admin'
mysql> GRANT ALL ON Employees TO 'admin'@'localhost';
Query OK, 0 rows affected (0.01 sec)

mysql> -- Grant ALL privileges on the entire ExampleDB database to 'admin'
mysql> GRANT ALL ON ExampleDB.* TO 'admin'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> -- Show the privileges for 'guest' user
mysql> SHOW GRANTS FOR 'guest'@'localhost';
+------------------------------------------------------------------------+
| Grants for guest@localhost                                             |
+------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `guest`@`localhost`                              |
| GRANT SELECT, INSERT ON `ExampleDB`.`Employees` TO `guest`@`localhost` |
+------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> -- Show the privileges for 'admin' user
mysql> SHOW GRANTS FOR 'admin'@'localhost';
+------------------------------------------------------------------------+
| Grants for admin@localhost                                             |
+------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `admin`@`localhost`                              |
| GRANT ALL PRIVILEGES ON `ExampleDB`.* TO `admin`@`localhost`           |
| GRANT ALL PRIVILEGES ON `ExampleDB`.`Employees` TO `admin`@`localhost` |
+------------------------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> -- Revoke INSERT privilege from the 'guest' user on Employees table
mysql> REVOKE INSERT ON Employees FROM 'guest'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> -- Revoke all privileges from the 'guest' user on Employees table
mysql> REVOKE ALL ON Employees FROM 'guest'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> -- Revoke all privileges on the entire ExampleDB database from 'guest'
mysql> REVOKE ALL ON ExampleDB.* FROM 'guest'@'localhost';
ERROR 1141 (42000): There is no such grant defined for user 'guest' on host 'localhost'
mysql> -- Drop the 'admin' user from the MySQL server
mysql> DROP USER 'admin'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> DROP USER 'guest'@'localhost';
Query OK, 0 rows affected (0.01 sec)
