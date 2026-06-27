delimiter //
create procedure GEmpbySal(IN Sal INT)
begin
	select * from Employee where Salary = Sal;
end; //
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

mysql> call GEmpbySal(45000);
+-----+-------+----------+------+
| SSN | Name  | Salary   | Dno  |
+-----+-------+----------+------+
| 100 | Alice | 45000.00 |    1 |
| 104 | D     | 45000.00 |    1 |
+-----+-------+----------+------+
2 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call GEmpbySal(80000);
+-----+------+----------+------+
| SSN | Name | Salary   | Dno  |
+-----+------+----------+------+
| 102 | F    | 80000.00 |    3 |
+-----+------+----------+------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
