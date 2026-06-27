delimiter //
create procedure GHSal()
BEGIN 
	select * from Employee where Salary > 40000;
END //
delimiter ;
