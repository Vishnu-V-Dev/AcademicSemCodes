delimiter //
create function cus(credit decimal(10,2))
returns varchar(30)
deterministic
begin
	declare cus1 varchar(30);
	if credit >= 50000 then
		set cus1 = 'Platinum';
	elseif credit >= 1000 then
		set cus1 = 'Gold';
	else
		set cus1 = 'Silver';
	end if;
	
	return cus1;
end //
delimiter ;
