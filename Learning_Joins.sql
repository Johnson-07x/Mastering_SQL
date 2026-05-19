CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);
INSERT INTO employees1
VALUES
(1, 'Rahul', 101, NULL, 45000),
(2, 'Arun', 102, 1, 50000),
(3, 'Meena', 103, 1, 65000),
(4, 'John', 104, 2, 47000),
(5, 'Priya', NULL, 2, 52000),
(6, 'Kavin', 102, 4, 70000);

CREATE TABLE departments1 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments1
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(105, 'Testing');

select * from departments1;

select * from
employees1 as t1 right join departments1 as t2
on t1.dept_id = t2.dept_id;

select t1.emp_name, t2.dept_name
from employees1 as t1 left join departments1 as t2
on t1.dept_id = t2.dept_id;

select *
from employees1 as t1 right join departments1 as t2
on t1.dept_id = t2.dept_id
where isnull(t1.emp_id);

select t1.emp_name, t2.dept_name
from employees1 as t1 left join departments1 as t2
on t1.dept_id = t2.dept_id
where t2.dept_name = "IT";

select t1.salary, t2.dept_name
from employees1 as t1 right join departments1 as t2
on t1.dept_id = t2.dept_id;

select t1.emp_name, t2.dept_name, t1.salary
from employees1 as t1 left join departments1 as t2
on t1.dept_id = t2.dept_id
order by t1.salary;

-- self join
select t1.emp_name, t2.emp_name as "Manager Name"
from employees1 as t1 inner join employees1 as t2
on t1.manager_id = t2.emp_id;

-- emp_name who works under rahul
select t1.emp_name as "Manager", t2.emp_name as "Employee"
from employees1 as t1 inner join employees1 as t2
on t1.emp_id = t2.manager_id
where t1.emp_name = "Rahul";

-- find employee who do not have mangaer
select emp_id from employees1
where manager_id is null;

-- display all emp and their mng name and manager's mangaer name
select t1.emp_name, t2.emp_name as "Manager Name", t3.emp_name as "MM name"
from employees1 as t1 
inner join employees1 as t2 on t1.manager_id = t2.emp_id
left join employees1 as t3 on t2.manager_id = t3.emp_id;

select * from employees1;

-- WQTD count of emp under each manager
select t2.emp_name as "Manager name", count(*) as "Total emp"
from employees1 as t1 inner join employees1 as t2
on t1.manager_id = t2.emp_id
group by t2.emp_name;

-- WQTD employees managed by same manager
select t1.emp_name, t2.emp_name, t1.manager_id
from employees1 t1 inner join employees1 t2
on t1.manager_id = t2.manager_id
and t1.emp_id != t2.emp_id;

select * from employees1;
-- WQTD Manager of John
select t1.emp_name as "Employee", t2.emp_name as "Manager"
from employees1 t1 inner join employees1 t2
on t1.manager_id = t2.emp_id
where t1.emp_name = "John";

-- WQTD Manager's Manager name of "John"
select t1.emp_name, t2.emp_name as "Manager Name", t3.emp_name as "MM name"
from employees1 as t1 
inner join employees1 as t2 on t1.manager_id = t2.emp_id
left join employees1 as t3 on t2.manager_id = t3.emp_id
where t1.emp_name = "John";
