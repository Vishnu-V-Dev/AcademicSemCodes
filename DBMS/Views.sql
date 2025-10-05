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

mysql> insert into Emp
    -> values
    -> (1,'Alice','HR',40000),
    -> (2,'Bob','IT',55000),
    -> (3,'Charlie','Finance',60000),
    -> (4,'David','IT',52000),
    -> (5,'Eva','HR',45000);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Emp;
+------+---------+---------+----------+
| E_ID | Name    | Dept    | Salary   |
+------+---------+---------+----------+
|    1 | Alice   | HR      | 40000.00 |
|    2 | Bob     | IT      | 55000.00 |
|    3 | Charlie | Finance | 60000.00 |
|    4 | David   | IT      | 52000.00 |
|    5 | Eva     | HR      | 45000.00 |
+------+---------+---------+----------+
5 rows in set (0.00 sec)

mysql> create VIEW IT_Employees AS
    -> select E_ID, Name, Salary from Emp
    -> where Dept = 'IT';
Query OK, 0 rows affected (0.03 sec)

mysql> select * from IT_Employees;
+------+-------+----------+
| E_ID | Name  | Salary   |
+------+-------+----------+
|    2 | Bob   | 55000.00 |
|    4 | David | 52000.00 |
+------+-------+----------+
2 rows in set (0.01 sec)

mysql> drop VIEW IT_Employees;
Query OK, 0 rows affected (0.02 sec)
