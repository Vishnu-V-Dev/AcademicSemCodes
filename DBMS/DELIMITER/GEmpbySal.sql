delimiter //
create procedure GEmpbySal(IN Sal INT)
begin
	select * from Employee where Salary = Sal;
end; //
delimiter ;
