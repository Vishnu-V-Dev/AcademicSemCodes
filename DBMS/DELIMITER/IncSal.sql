delimiter //
create procedure IncSal(IN empSSN INT,OUT newSal DECIMAL(10,2))
begin
	select Salary INTO newSal from Employee where SSN = empSSN;
	SET newSal = newSal*1.10;
	UPDATE Employee SET Salary = newSal where SSN = empSSN;
end //
delimiter ;
