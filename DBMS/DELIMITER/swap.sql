delimiter //
create procedure swap(INOUT a int, INOUT b int)
begin
	declare temp int;
	SET temp = a;
	SET a = b;
	SET b = temp;
end //
delimiter ;
