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
select salary, row_number() over(order by salary desc) from employees;

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
select ascii(substr(emp_name, 1, 1)) from employees;

-- 53. Convert ASCII values back to characters.
SELECT char(ascii(substr(emp_name, 1, 1))) from employees;

-- 54. Display day name from joining_date.
select dayname(joining_date) from employees;

-- 55. Display month name from joining_date.
select monthname(joining_date) from employees;

-- 56. Find last day of current month.
select last_day(joining_date) from employees;

-- 57. Find difference between current date and joining_date.
select datediff(last_day(joining_date), joining_date) from employees;

-- 58. Add 1 year to joining_date.
select date_add(joining_date, interval 365 day) from employees;

-- 59. Subtract 6 months from joining_date.
select date_sub(joining_date, interval 180 day) from employees;

-- 60. Format joining_date as DD-MM-YYYY.
select date_format(joining_date, "%d-%m-%y") from employees;

-- 61. Find employees who joined in a specific month.
select emp_name, joining_date from employees
where month(joining_date) = 1;

-- 62. Find employees who joined on weekends.
select emp_name, joining_date, dayname(joining_date) from employees
where dayname(joining_date) = "Saturday" or "Sunday";

-- 63. Display current database name.
select database();

-- 64. Display MySQL version.
select version();

-- 65. Generate UUID values.
select uuid();

-- 66. Generate random numbers using RAND().
select rand();

-- 67. Format salary with commas and decimal places.
select format(salary, 2) from employees;

-- 68. Find greatest value among salary, bonus, and age.
select greatest(salary, bonus, age) from employees;
    
-- 69. Find least value among salary, bonus, and age.
select least(salary, bonus, age) from employees;

-- 70. Use COALESCE function with NULL values.
select coalesce(null, null, emp_name, age) from employees;

-- 71. Use NULLIF function with salary values.
select nullif(salary, 20000) from employees;

-- 72. Find employees whose names contain letter &#39;a&#39;.
select emp_name from employees
where emp_name like "%a%";

-- 73. Find employees whose names end with &#39;n&#39;.
select emp_name from employees
where emp_name like "%n";

-- 74. Display top 2 highest paid employees department-wise.
SELECT emp_name, department, salary 
FROM (
    SELECT emp_name, department, salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked_employees
WHERE salary_rank <= 2;

-- 75. Find cumulative salary using window functions.
SELECT 
    emp_name, 
    salary,
    SUM(salary) OVER (ORDER BY emp_name) AS cumulative_salary
FROM employees;

-- 76. Divide employees into groups using NTILE function.
SELECT 
    emp_name, 
    department,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- 77. Display next salary using LEAD function.
SELECT 
    emp_name, 
    salary,
    LEAD(salary, 1, 0) OVER (ORDER BY salary DESC) AS next_lower_salary
FROM employees;

-- 78. Display first salary using FIRST_VALUE function.
select emp_name, salary,
first_value(salary) OVER (ORDER BY salary DESC) AS highest_company_salary
FROM employees;

-- 79. Display last salary using LAST_VALUE function.
select emp_name, salary,
last_value(salary) over(order by salary desc) as last_salary
from employees;

-- 80. Concatenate all employee names using GROUP_CONCAT.
select group_concat(emp_name) from employees;

-- 81. Count employees city-wise.
select city, count(*) from employees
GROUP BY city;

-- 82. Find average salary city-wise.
select city, avg(salary) from employees
group by city;

-- 83. Find highest salary in each department.
select department, max(salary) from employees
group by department;

-- 84. Find lowest salary in each department.
select department, min(salary) from employees
group by department;

-- 85. Find departments having more than 2 employees.
select department, count(*) as emp_count from employees
group by department
having emp_count > 2;

-- 86. Find employees with salary greater than department average.
select emp_name, department, salary from employees e
where salary > any(
	select salary from employees
    where department = e.department
);

-- 87. Find employees whose salary equals maximum salary.
select emp_name, department from employees e
where salary = (
	select max(salary) from employees
    where department = e.department
);

-- 88. Find employees whose age is greater than average age.
select emp_name, age from employees
where age > (select avg(age) from employees);

-- 89. Display employee details with formatted joining dates.
select date_format(joining_date, "%d-%m-%y") from employees;

-- 90. Generate employee initials using string functions.
SELECT 
    emp_name,
    CONCAT(
        LEFT(emp_name, 1), 
        SUBSTRING(emp_name, LOCATE(' ', emp_name) + 1, 1)
    ) AS initials
FROM employees;

-- 91. Find number of days employees worked in company.
select emp_name, joining_date, datediff(now(), joining_date) as "Days Worked"
from employees;

-- 92. Find employees who joined in the current year.
select emp_name, joining_date from employees
where year(joining_date) = year(now());

-- 93. Find employees with palindrome names using REVERSE.
select emp_name from employees
where reverse(emp_name) = emp_name;

-- 94. Find employees with even salaries using MOD function.
select emp_name, salary, mod(salary, 2) from employees
where mod(salary, 2) = 0;

-- 95. Find employees with odd ages using MOD function.
select emp_name, age from employees
where mod(age, 2) = 0;

-- 96. Display employees ordered randomly.
select * from employees
order by rand();

-- 97. Create ranking without gaps using DENSE_RANK.
SELECT 
    emp_name, 
    department,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS continuous_salary_rank
FROM employees;

-- 98. Find salary difference between current and previous employee.
select emp_name, salary,
lead(salary, 1, salary) over (order by salary desc) as next_employee_salary,
(salary - lead(salary, 1, salary) over (order by salary desc)) as salary_difference
from employees;

-- 99. Display department-wise total salary using OVER clause.
SELECT 
    emp_name,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department) AS department_total_salary
FROM employees;

-- 100. Generate complete employee report using multiple functions together.
SELECT 
    -- 1. Basic Details & Text Formatting
    emp_id,
    UPPER(emp_name) AS employee_name,
    CONCAT(LEFT(emp_name, 1), SUBSTRING(emp_name, LOCATE(' ', emp_name) + 1, 1)) AS initials,
    department,
    
    -- 2. Date Formatting
    DATE_FORMAT(joining_date, '%d-%M-%Y') AS formatted_joining_date,
    
    -- 3. Salary Metrics & Window Rankings
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
    
    -- 4. Analytical Comparison Window Functions
    SUM(salary) OVER (PARTITION BY department) AS dept_total_payroll,
    AVG(salary) OVER (PARTITION BY department) AS dept_average_salary,
    
    -- 5. Next/Previous Comparisons
    LEAD(salary, 1, 0) OVER (PARTITION BY department ORDER BY salary DESC) AS next_lower_dept_salary,
    (salary - LEAD(salary, 1, salary) OVER (PARTITION BY department ORDER BY salary DESC)) AS salary_step_down,
    
    -- 6. Advanced Mathematical Logic (Percentage of Department Contribution)
    ROUND((salary / SUM(salary) OVER (PARTITION BY department)) * 100, 2) AS payroll_contribution_pct,
    
    -- 7. Conditional Status using CASE WHEN
    CASE 
        WHEN salary > AVG(salary) OVER (PARTITION BY department) THEN 'Above Average'
        WHEN salary = AVG(salary) OVER (PARTITION BY department) THEN 'Exact Average'
        ELSE 'Below Average'
    END AS salary_status

FROM employees
ORDER BY department, salary DESC;
