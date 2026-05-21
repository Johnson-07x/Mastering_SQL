-- Sub Queries -- 

create table psr (
	emp_id int primary key,
    emp_name varchar(50),
    department varchar(50),
    salary int
);

insert into psr values 
(101, "John", "HR", 40000),
(102, "Allice", "IT", 60000),
(103, "Bob", "IT", 50000),
(104, "David", "Finance", 50000),
(105, "Emma", "HR", 45000);

create table depart (
	dept_id int,
    department varchar(50) primary key,
    location varchar(50)
);

insert into depart values
(1, "IT", "Chennai"),
(2, "Finance", "Coimbatore"),
(3, "HR", "Bangalore");

-- Sub Queries -- 
select * from psr;
select * from depart;

-- WQTD all employee rec from psr that are having dept_id = 2 -- 
select * from psr
where department = (
	select department from depart
    where dept_id = 2
);

-- WQTD find employees earning more than david -- 
select * from psr
where salary > (
	select salary from psr
    where emp_name = "David"
);

-- WQTD Find employees working in the sam dept as david
select * from psr
where department = (
	select department from psr
    where emp_name = "Bob"
);

-- WQTD find employees whose salary is less than the average salary
select * from psr
where salary < (
	select avg(salary) from psr
);

-- Multiple Row SubQueries -- 

-- Find Employees working in located in Bangalore -- 
select * from psr
where department in (
	select department from depart
    where location = "Bangalore"
);

-- find employeess whose salary matched salaries of HR department -- 
select * from psr
where salary in (
	select salary from psr
    where department = "HR"
) and department <> "HR";

-- find employees earning more than any employee in HR -- 
select * from psr
where salary > any(
	select salary from psr
    group by department = "HR"
);


-- Corelated SubQuery -- 

-- find employees earning more than the average salary of their department -- 
select * from psr t1
where salary > (
	select avg(salary) from psr
    where department = t1.department
);

-- WQTD max salary in each department -- 
select emp_name, department from psr p
where salary = (
	select max(salary) from psr
    where department = p.department
);

-- WQTD fin
select * from psr p
where salary < (
	select avg(salary) from psr
    where department = p.department
);

-- sample but not working
select emp_name, department from psr p
where salary = (
	select salary from psr
    where department = p.department
    order by salary desc
    limit 2
);

-- WQTD find departments where employees earn more than 50,000
select distinct department from psr p
where department in (
	select department from psr
    where salary > 50000
);

-- s
select * from psr t1
where salary = (
	select salary from psr
    where department = t1.department
    order by salary desc
    limit 1
    offset 1
);

-- Find employees whose salary matches another employee in the same department
select * from psr p
where salary = any(
	select salary from psr
    where department = p.department
);

-- WQTD second highest salary
select * from psr p
where salary = (
	select salary from psr
    order by salary desc
    limit 1
    offset 1
);

select department, salary from psr p
where salary in (
	select max(salary) from psr
    where department = p.department
    order by salary desc
);