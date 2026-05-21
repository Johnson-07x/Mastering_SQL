-- use joins_db;

-- ----------> TCL

-- create table account(acc_id int primary key, acc_name varchar(22), balance decimal(12,2) check (balance>=0));

insert into account values(101,'Ravi',10000.00),(102,'Karthi',5000.00);

select * from account;

start transaction;
update account set balance = balance-2000 where acc_id = 101;
update account set balance = balance +2000 where acc_id =102;

select * from account;
rollback;
commit;




start transaction;
savepoint after_first_debit;
update account set balance = balance-2000 where acc_id = 101;
savepoint after_second_debit;
rollback to after_first_debit;
commit;
select * from account;