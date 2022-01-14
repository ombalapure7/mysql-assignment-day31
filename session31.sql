CREATE DATABASE guvi;
USE guvi;

1. Create tables for the above list given

CREATE TABLE mentors (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    experience INT,
    expertise VARCHAR(256),
    PRIMARY KEY (id)
);

# ------------------------------------------------

CREATE TABLE students (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255),
    PRIMARY KEY (id)
);

# ------------------------------------------------

CREATE TABLE codekata(
	id INT NOT NULL AUTO_INCREMENT,
    problems INT,
    student_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (student_id) REFERENCES students (id)
);

# ------------------------------------------------

CREATE TABLE company_drives (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    package INT,
    PRIMARY KEY (id),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (id)
);

# ------------------------------------------------

CREATE TABLE courses (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    type VARCHAR(256),
	fees INT,
    PRIMARY KEY (id),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (id)
);

# ------------------------------------------------

CREATE TABLE attendance (
	id INT NOT NULL AUTO_INCREMENT,
    attendance INT NOT NULL,
    PRIMARY KEY(id),
	student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (id)
);
-- ALTER TABLE attendance RENAME COLUMN attendance TO attendance_percent;

# ------------------------------------------------


CREATE TABLE topics (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    duration_weeks INT,
    PRIMARY KEY (id)
);

# ------------------------------------------------


CREATE TABLE tasks (
	id INT NOT NULL AUTO_INCREMENT,
    name INT NOT NULL,
    PRIMARY KEY(id),
	topic_id INT,
    FOREIGN KEY (topic_id) REFERENCES topics (id)
);


# ================================================================================

2. insert at least 5 rows of values in each table

INSERT INTO mentors VALUES 
	  (1, 'Raghav', 5, 'Frontend'),
    (2, 'Raghu', 6, 'DBA'),
    (3, 'Sherlyn', 3, 'Backend'),
    (4, 'Shyam', 8, 'Fullstack'),
    (5, 'Sundar', 1, 'Backend');

# ------------------------------------------------

-- ALTER TABLE students DROP column github;
INSERT INTO students VALUES
	(1, 'Om', 'om@gmail.com'),
    (2, 'Ankita', 'ankita@gmail.com'),
    (3, 'Shivam', 'shivam@gmail.com'),
    (4, 'Sakshi', 'sakshi@gmail.com'),
    (5, 'Nihal', 'nihal@gmail.com');

# ------------------------------------------------

INSERT INTO codekata VALUES
	(1, 120, 1),
	(2, 500, 2),
    (3, 430, 3),
    (4, 0, 4),
    (5, 45, 5);

# ------------------------------------------------

INSERT INTO company_drives VALUES
	(1, 'Paypal', 23, 1),
    (2, 'Zoho', 15, 1),
    (3, 'Freshworks', 10, 1),
    (4, 'Dell', 11, 2),
    (5, 'Dunzo', 6, 2),
    (6, 'Chargebee', 20, 2),
    (7, 'Paytm', 17, 3),
    (8, 'Stratus', 10, 3),
    (9, 'Swiggy', 4, 4);

# ------------------------------------------------

INSERT INTO courses VALUES 
	(1, 'Fullstack with Javascript', 'Live', 70000, 1),
    (2, 'Javascript Crash Course', 'Recorded', 150, 1),
    (3, 'Go Fundamental', 'Recorded', 450, 2),
    (4, 'Javascript Crash Course', 'Recorded', 350, 2),
    (5, 'Fullstack with Python', 'Live', 62000, 3),
    (6, 'Java Basics', 'Recorded', 1000, 4),
    (7, 'Advanced Java', 'Live', 45000, 4);

# ------------------------------------------------

INSERT INTO attendance VALUES
	  (1, 80, 1),
    (2, 56, 2),
    (3, 89, 3),
    (4, 50, 4),
    (5, 0, 5);

# ------------------------------------------------

INSERT INTO topics VALUES
	(1, 'Web Fundamentals', 1),
    (2, 'HTML & CSS', 2),
    (3, 'Javascript', 3),
    (4, 'React JS', 4),
    (5, 'Node JS', 1),
    (6, 'MYSQL and MONGODB', 2);

# ------------------------------------------------

INSERT INTO tasks VALUES
	(1, 'Explain how web works', 1),
    (2, 'HTML and CSS basics', 2),
    (3, 'Create a landing page', 2),
    (4, 'Consume an API', 3),
    (5, 'Tic Toe Game', 3),
    (6, 'CRUD app using MockAPI', 4),
    (7, 'Read/Write to files', 5);
    

# ================================================================================

3. get number problems solved in codekata by combining the users
SELECT students.name, codekata.problems FROM students
JOIN codekata ON students.id=codekata.student_id;
-- name   problems
-- Ankita	500
-- Nihal	e45
-- Om	    120
-- Sakshi	0
-- Shivam	430

# ================================================================================

4. display the no of company drives attended by a user
SELECT students.name AS 'Student Name', COUNT(company_drives.id) AS 'No. of Companies'
FROM students
LEFT JOIN company_drives ON students.id=company_drives.student_id
GROUP BY company_drives.student_id;
-- Student Name  No. of Companies
-- Om	 	     3
-- Ankita	     3
-- Shivam	     2
-- Sakshi	     1
-- Nihal         0

# ================================================================================

5. combine and display courses for a specific user
SELECT students.name as 'Student Name', courses.name as 'Course Name' FROM students
LEFT JOIN courses ON students.id=courses.student_id
HAVING students.name='Om' AND courses.name='Javascript Crash Course';
-- Student Name    Course Name
-- Om	           Javascript Crash Course

# ================================================================================

6. list all the mentors
SELECT * FROM mentors;
-- id   name    experience expertise
-- 1	Raghav	5	       Frontend
-- 2	Raghu	6	       DBA
-- 3	Sherlyn	3	       Backend
-- 4	Shyam	8	       Fullstack
-- 5	Sundar	1	       Backend

# ================================================================================

7. list the number of students that are assigned for a mentor
SELECT students.name as 'Student Name', mentors.name  as 'Mentor Name' FROM mentors
JOIN students ON mentors.id=students.mentor_id;
-- Student Name    Mentor Name
-- Om	            Raghav
-- Ankita	        Raghu
-- Shivam	        Sherlyn
-- Sakshi	        Shyam








    
