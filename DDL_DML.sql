CREATE SCHEMA college_db;

USE college_db;

CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name TEXT,
    age INT,
    city TEXT,
    marks FLOAT
);

SELECT * FROM students;

DESC students;

ALTER TABLE students
MODIFY COLUMN student_id INT PRIMARY KEY AUTO_INCREMENT;

INSERT INTO students (student_name, age, city, marks)
VALUES 	("Johnson", 20, "Virudhunagar", 98.7),
		("Vignesh", 21, "Kovilpatti", 94.3),
        ("Ramesh", 41, "Rajapalayam", 86.2),
        ("Suresh", 23, "Sevalpatti", 95.5),
        ("Kamal", 24, "Sivakasi", 75.9);
        
SELECT * FROM students;

SELECT student_name, marks
FROM students;

UPDATE students
SET marks = 99.7 WHERE student_id = 1;

DELETE FROM students
WHERE student_id = 4;

ALTER TABLE students
ADD COLUMN email TEXT;

ALTER TABLE students
RENAME COLUMN marks TO score;

ALTER TABLE students
MODIFY COLUMN city VARCHAR(25);

ALTER TABLE students
DROP COLUMN email;

TRUNCATE TABLE students;

DROP TABLE students;

DROP SCHEMA college_db;