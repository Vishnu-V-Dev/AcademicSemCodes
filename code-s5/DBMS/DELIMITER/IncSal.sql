delimiter //
create procedure IncSal(IN empSSN INT,OUT newSal DECIMAL(10,2))
begin
	select Salary INTO newSal from Employee where SSN = empSSN;
	SET newSal = newSal*1.10;
	UPDATE Employee SET Salary = newSal where SSN = empSSN;
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

mysql> call IncSal(100, @s);
Query OK, 1 row affected (0.02 sec)

mysql> select @s as newSal;
+----------+
| newSal   |
+----------+
| 49500.00 |
+----------+
1 row in set (0.00 sec)

mysql> set @s = 2;
Query OK, 0 rows affected (0.00 sec)

mysql> call IncSal(100, @s);
Query OK, 1 row affected (0.02 sec)

mysql> select @s as newSal;
+----------+
| newSal   |
+----------+
| 54450.00 |
+----------+
1 row in set (0.00 sec)
