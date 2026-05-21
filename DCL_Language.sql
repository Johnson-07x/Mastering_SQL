create database  dcl_db;

use dcl_db;

create table MRhospital(
	p_name varchar(30),
    p_id int primary key,
    p_issue varchar(50)
);

insert into MRhospital values
("subs", 101, "fever"),
("shanmuga priya", 102, "leg pain"),
("sahana", 103, "headache");

select * from mrhospital;

create user "rk"@"localhost"
identified by "1234";

select user, host
from mysql.user;

-- grant previlage
-- on table_name
-- to user@localhost;

grant select
on MRhospital
to "rk"@"localhost";

-- displays the 
show grants for "rk"@"localhost";

grant all
on MRhospital
to "rk"@"localhost";

-- granting procedure creating access to RK
grant create routine
on dcl_db.*
to "rk"@"localhost";

-- revoking all privileges from RK
revoke all PRIVILEGES, grant option
from "rk"@"localhost";

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'rk'@'localhost';
