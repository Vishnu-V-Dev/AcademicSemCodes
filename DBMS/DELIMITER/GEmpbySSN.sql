delimiter //
create procedure GEmpbySSN(IN empSSN INT, OUT empSal DECIMAL(10,2))
begin
	select Salary INTO empSal FROM Employee where SSN = empSSN;
end //
delimiter ;

mysql> select *from Employee;
+-----+-------+----------+------+
| SSN | Name  | Salary   | Dno  |
+-----+-------+----------+------+
| 100 | Alice | 45000.00 |    1 |
| 101 | Bob   | 40000.00 |    2 |
| 102 | F     | 80000.00 |    3 |
| 103 | C     | 35000.00 |    1 |
| 104 | D     | 45000.00 |    1 |
| 105 | E     | 60000.00 |    2 |
+-----+-------+----------+------+
6 rows in set (0.00 sec)

mysql> call GEmpbySSN(100,@s);
Query OK, 1 row affected (0.00 sec)

mysql> select @s as Emp;
+----------+
| Emp      |
+----------+
| 45000.00 |
+----------+
1 row in set (0.00 sec)

mysql> select @s as Emp_Sal;
+----------+
| Emp_Sal  |
+----------+
| 45000.00 |
+----------+
1 row in set (0.00 sec)

mysql> select @s as Emp_Sal;
+----------+
| Emp_Sal  |
+----------+
| 40000.00 |
+----------+
1 row in set (0.00 sec)
