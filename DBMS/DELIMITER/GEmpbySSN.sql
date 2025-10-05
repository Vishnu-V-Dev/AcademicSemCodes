delimiter //
create procedure GEmpbySSN(IN empSSN INT, OUT empSal DECIMAL(10,2))
begin
	select Salary INTO empSal FROM Employee where SSN = empSSN;
end //
delimiter ;
