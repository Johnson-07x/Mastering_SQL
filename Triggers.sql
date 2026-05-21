-- Triggers -- 

create table student_trigger (
	id int,
    name text,
    phone bigint
);

delimiter $$
create trigger check_phone
before insert on student_trigger
for each row
begin
	if new.phone not regexp "^[0-9]{10}$" then
		signal sqlstate "45000"
		set message_text = "Mobile Number must be 10 digits";
    end if;
end $$
delimiter ;

insert into student_trigger values
(101, "Johnson", 915980948);

-- update trigger to check the salary updatation should not be go below 30k

create table employees (
	emp_id int,
	emp_name text,
    salary int
);

drop table employee;
delimiter $$
create trigger update_salary
before update on employees
for each row
begin
	if new.salary <= 30000 then
		signal sqlstate "45000"
		set message_text = "Salary cannot be under 30,000";
	end if;
end $$
delimiter ;

insert into employees values (2, "Ramesh", 30000);

select * from employees;

update employees
set salary = 30000
where emp_id = 2;