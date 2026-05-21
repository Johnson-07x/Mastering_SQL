-- procedure to print names in the table
delimiter $$
create procedure display()
begin
	select p_name
	from mrhospital;
end $$
delimiter ;

call display();

-- prodecure to print id, issue from the table
delimiter $$
create procedure display_details()
begin
	select p_id, p_issue
    from mrhospital;
end $$
delimiter ;

call display_details();

-- prodecure to print id, issue from the table using id
delimiter $$
create procedure display_details_byid(in id int)
begin
	select p_name, p_issue
    from mrhospital
    where p_id = id;
end $$
delimiter ;

call display_details_byid(102);

-- store count of the table in the count variable
-- delimiter $$
-- create 

-- double salary using procedure
set @salary = 1000;
select @salary;

delimiter $$
create procedure double_salary(inout salary int)
begin
	set salary = salary * 2;
    call check_matching_salary(salary);
end $$
delimiter ;

drop procedure double_salary;
call double_salary(@salary);
select @salary;

-- emp table
use learn_mysql;
select * from employees;
set @salary = 25000;
select @salary;

delimiter $$
create procedure check_matching_salary(in salary int)
begin
    select * from employees e
    where e.salary = salary;
end $$
delimiter ;

drop procedure check_matching_salary;
call check_matching_salary(@salary);

-- give hike 30% from employees in HR dept
select * from employees1;


delimiter $$
create procedure give_hike(in id int)
begin
	update employees1
	set salary = salary * 1.3
	where dept_id = id;
end $$
delimiter ;

call give_hike(103);

-- Bank Transaction
create database procedures_db;
use procedures_db;

create table accounts (
	acc_id int primary key,
    acc_name varchar(30),
    balance decimal(10,2)
);

insert into accounts values 
(101, "Kiruba", 50000),
(102, "Karan", 30000);

select * from accounts;

set @msg = "No Data";
select @msg;

delimiter $$
create procedure transfer_money(
	in from_acc int,
	in to_acc int,
    in amount decimal(10, 2),
    in msg text
)
begin
	declare msg text;
	declare curr_balance decimal(10, 2);
    
    select balance into curr_balance from accounts
    where acc_id = from_acc;
    
    if (amount <= curr_balance) then
		start transaction;
			update accounts set balance = balance - amount
            where acc_id = from_acc;
            update accounts set balance = balance + amount
            where acc_id = to_acc;
            commit;
            
            set @msg = "Transaction Done";
	else
		set @msg = "Insufficient Balance";
	end if;
    
    select @msg;
end $$
delimiter ;

drop procedure transfer_money;
call transfer_money(101, 102, 2000000, @msg);
select @msg;

select * from accounts;