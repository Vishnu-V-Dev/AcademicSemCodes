delimiter //
create procedure swap(INOUT a int, INOUT b int)
begin
	declare temp int;
	SET temp = a;
	SET a = b;
	SET b = temp;
end //
delimiter ;

mysql> set @x=2;
Query OK, 0 rows affected (0.00 sec)

mysql> set @y=3;
Query OK, 0 rows affected (0.00 sec)

mysql> call swap(@x,@y);
Query OK, 0 rows affected (0.00 sec)

mysql> select @x as n1, @y as n2;
+------+------+
| n1   | n2   |
+------+------+
|    3 |    2 |
+------+------+
1 row in set (0.00 sec)
