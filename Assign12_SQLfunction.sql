CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2) DEFAULT 0.00,
    age INT,
    city VARCHAR(100),
    joining_date DATE
);

INSERT INTO employees (emp_id, emp_name, department, salary, bonus, age, city, joining_date) VALUES
(1, 'Rahul', 'HR', 45000.00, 5000.00, 25, 'Chennai', '2022-01-10'),
(2, 'Arun', 'IT', 50000.00, 7000.00, 28, 'Madurai', '2021-06-15'),
(3, 'Meena', 'Finance', 65000.00, 9000.00, 30, 'Coimbatore', '2020-03-25'),
(4, 'John', 'Testing', 47000.00, 4000.00, 27, 'Chennai', '2023-02-12'),
(5, 'Priya', 'IT', 52000.00, 6000.00, 26, 'Bangalore', '2022-08-18'),
(6, 'Kavin', 'Management', 75000.00, 12000.00, 31, 'Madurai', '2019-11-20'),
(7, 'Sneha', 'HR', 42000.00, 3500.00, 24, 'Trichy', '2023-05-14'),
(8, 'Vignesh', 'IT', 68000.00, 10000.00, 29, 'Salem', '2020-09-30'),
(9, 'Divya', 'Finance', 58000.00, 8000.00, 27, 'Chennai', '2021-12-01'),
(10, 'Akash', 'Testing', 49000.00, 4500.00, 26, 'Madurai', '2022-04-11'),
(11, 'Keerthi', 'IT', 72000.00, 11000.00, 32, 'Bangalore', '2018-07-19'),
(12, 'Sanjay', 'HR', 46000.00, 3000.00, 25, 'Coimbatore', '2023-01-08'),
(13, 'Nivetha', 'Finance', 61000.00, 8500.00, 29, 'Chennai', '2020-10-10'),
(14, 'Harish', 'Management', 80000.00, 15000.00, 35, 'Madurai', '2017-06-22'),
(15, 'Lavanya', 'Testing', 53000.00, 5000.00, 28, 'Trichy', '2021-03-17');


use learn_mysql;

select * from employees;

-- 1. Find total number of employees.
select count(*) from employees;

-- 2. Find total salary of all employees.
select sum(salary) from employees;

-- 3. Find average salary of employees.
select avg(salary) from employees;

-- 4. Find highest salary.
select max(salary) from employees;

-- 5. Find lowest salary.
select min(salary) from employees;

-- 6. Count employees department-wise.
select department, count(*) as emp_count from employees
group by department;

-- 7. Find average salary department-wise.
select department, avg(salary) from employees
group by department;

-- 8. Find departments whose total salary is greater than 100000.
select department, sum(salary) from employees
group by department having sum(salary) > 100000;

-- 9. Display all employee names in uppercase.
select upper(emp_name) from employees;

-- 10. Display all employee names in lowercase.
select lower(emp_name) from employees;

-- 11. Find length of each employee name.
select emp_name, length(emp_name) from employees;

-- 12. Combine employee name and department in one column.
select concat(emp_name, " - ", department) as info from employees;

-- 13. Extract first 3 characters from employee names.
select left(emp_name, 3) from employees;

-- 14. Reverse employee names.
select reverse(emp_name) from employees;

-- 15. Replace department name &#39;IT&#39; with &#39;Developer&#39;.
select department, replace(department, "IT", "Developer") from employees;

-- 16. Display current date.
select date(now());

-- 17. Display current time.
select time(now());

-- 18. Display current date and time.
select sysdate();

-- 19. Extract joining year from joining_date.
select year(joining_date) from employees;

-- 20. Extract joining month from joining_date.
select month(joining_date) from employees;

-- 21. Find employees who joined after 2021.
select emp_name, year(joining_date) from employees
where year(joining_date) > 2021;

-- 22. Add 30 days to joining_date.
select date_add(joining_date, interval 30 day) from employees;

-- 23. Round salary values.
select round(salary) from employees;

-- 24. Find remainder when salary is divided by 1000.
select (salary / 1000) from employees;

-- 25. Find square root of salary.
select salary, sqrt(salary) from employees;

-- 26. Find salary raised to power 2.
select salary, power(salary, 2) from employees;

-- 27. Display department name or &#39;No Department&#39; if NULL.
select ifnull(department, "No department") from employees;

-- 28. Categorize employees using IF function: High Salary ,Low Salary
select emp_name, salary, if(salary > 60000, "High Salary", "Low salary")
from employees;

-- 29. Categorize employees using CASE statement: Excellent, Good, Average
select emp_name, case
	when (age > 30) then "Excellent"
    when (age > 25) then "Good"
    else "Average" end as "Category" from employees;
    
-- 30. Assign row numbers based on salary.
select salary, row_number() over(order by salary desc) from employees
order by salary desc;

-- 31. Rank employees based on salary.
select emp_name,salary, rank() over(order by salary desc)
from employees
order by salary desc;

-- 32. Display previous salary using LAG function.


-- 33. Find highest salary employee.
select emp_name, salary from employees
order by salary desc limit 1;

-- 34. Find second highest salary.
select emp_name, salary from employees
order by salary desc
limit 1 offset 1;

-- 35. Find employees whose names start with &#39;P&#39;.
select emp_name from employees
where emp_name like("P%");

-- 36. Find employees from Chennai.
select emp_name, city from employees
where city = "Chennai";

-- 37. Find employees whose salary is between 45000 and 60000.
select emp_name, salary from employees
where salary between 45000 and 60000;

-- 38. Display employees sorted by salary descending.
select emp_name, salary from employees
order by salary desc;

-- 39. Display top 3 highest salary employees.
select emp_name, salary from employees
order by salary desc
limit 3;

-- 40. Generate random employee records.
select * from employees
order by rand();

-- 41. Find total bonus amount.
select sum(bonus) as total_bonus from employees;

-- 42. Find maximum age of employees.
select max(age) from employees;

-- 43. Find minimum age of employees.
select min(age) from employees;

-- 44. Find average bonus department-wise.
select department, avg(bonus) from employees
group by department;

-- 45. Count distinct departments.
select count(distinct department) from employees;

-- 46. Display employee names using LEFT function.
select left(emp_name, length(emp_name)) from employees;

-- 47. Display employee names using RIGHT function.
select right(emp_name, length(emp_name)) from employees;

-- 48. Find position of substring in employee names.
select instr(emp_name, "Jo") from employees;

-- 49. Pad employee names using LPAD function.
select lpad(emp_name, length(emp_name) + 2, "*") from employees;

-- 50. Pad employee names using RPAD function.
select rpad(emp_name, length(emp_name) + 2, "*") from employees;

-- 51. Repeat employee names using REPEAT function.
select repeat(emp_name, 2) from employees;

-- 52. Display ASCII value of first character in employee names.
