CREATE SCHEMA company_db;

USE company_db;

CREATE TABLE employees (
	emp_id INT,
    emp_name TEXT,
    age INT,
    salary DECIMAL(10, 2),
    department VARCHAR(20),
    joining_date DATE
);

SELECT * FROM employees;

ALTER TABLE employees
MODIFY COLUMN department VARCHAR(50);

INSERT INTO employees
VALUES (1, "Johnson", 34, 1500000, "Senior Backend Developer", SYSDATE()),
       (2, "Kumar", 28, 950000, "Junior Java Developer", SYSDATE()),
       (3, "KIRUBA", 41, 2100000, "Lead Software Architect", SYSDATE()),
       (4, "David", 25, 600000, "Backend Intern", SYSDATE()),
       (5, "Sauvrav", 32, 1350000, "DevOps Engineer", SYSDATE()),
       (6, "Harshini", 29, 1100000, "Full Stack Engineer", SYSDATE()),
       (7, "Hermit", 36, 1650000, "Engineering Manager", SYSDATE()),
       (8, "Shadow", 27, 850000, "QA Automation Engineer", SYSDATE()),
       (9, "Mr.X", 30, 1200000, "Database Administrator", SYSDATE()),
       (10, "Tony", 38, 1800000, "Principal SpringBoot Expert", SYSDATE()),
       (11, "Stark", 26, 750000, "Data Engineer", SYSDATE()),
       (12, "Villiam", 33, 1400000, "Cloud Infrastructure Engineer", SYSDATE())
;


SELECT * FROM employees
WHERE salary > 50000;

SELECT emp_name FROM employees
WHERE department = "IT";

UPDATE employees
SET salary = salary * 1.10;

UPDATE employees
set department = "IT" WHERE emp_id = 6;

DELETE FROM employees
WHERE age > 40;

ALTER TABLE employees
ADD COLUMN email TEXT;

ALTER TABLE employees
MODIFY COLUMN email varchar(25) UNIQUE;

ALTER TABLE employees
RENAME TO company_staff;

CREATE TABLE departments (id INT PRIMARY KEY,
FOREIGN KEY(id) REFERENCES company_staff(emp_id));

SELECT * FROM company_staff
ORDER BY salary DESC;

TRUNCATE TABLE DEPARTMENTS;