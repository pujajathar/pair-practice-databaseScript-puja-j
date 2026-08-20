
-- Start Transaction
START TRANSACTION;

------------------------
-- DROP Tables
------------------------
DROP TABLE IF EXISTS library_resources;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS departments;

------------------------
-- CREATE Tables
------------------------

-- Departments table
CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(100) NOT NULL,
building VARCHAR(100) NOT NULL 
);

-- Courses Table
CREATE TABLE courses (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL,
course_code VARCHAR(100) NOT NULL,
department_id INT NOT NULL,
FOREIGN KEY (department_id)
	REFERENCES departments(department_id) 
);

-- Library Resources table
CREATE TABLE library_resources (
resource_id INT PRIMARY KEY AUTO_INCREMENT,
resource_title VARCHAR(100) NOT NULL,
course_id INT NOT NULL,
FOREIGN KEY(course_id) 
	REFERENCES courses(course_id),
FOREIGN KEY (department_id)
	REFERENCES departments(department_id)
);
------------------
-- Test tables
------------------
SELECT *FROM departments;
SELECT *FROM courses;
SELECT *FROM library_resources;

-------------------------
-- Insert Data 
-------------------------
INSERT INTO departments (department_name, building)
values ("Information Technology", "Technology building"),
("Anatomy", "Anatomy building"),
("Science", "Science building"),
("Math", "Math building");

INSERT INTO courses (course_name, course_code, department_id)
values("JavaScript", "JS123", 1),
("Java", "JV345", 1),
("SQL", "SQ678", 1),
("Mathematics", "M1234", 4);

INSERT INTO library_resources (resource_title, course_id)
values("JavaScript Fundamentals", 1),
("Java Basics", 1),
("Database introduction", 1),
("Algebra", 4);

-- SAVE CHANGES
COMMIT;

----------------------
-- Foreign Key
---------------------
SELECT courses.course_code, courses.course_name, departments.department_name
FROM courses
JOIN departments ON courses.department_id = departments.department_id;

SELECT library_resources.course_id,library_resources.resource_title,  courses.course_name, departments.department_name
FROM library_resources
	JOIN courses
		ON library_resources.course_id = courses.course_id
	JOIN departments 
		ON courses.department_id = departments.department_id;

