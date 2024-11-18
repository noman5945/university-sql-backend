-- Active: 1730817530748@@127.0.0.1@5432@university_db@public
CREATE DATABASE university_db;

-- Create Tables
CREATE TABLE student(
    student_id  SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(25) 
)

CREATE TABLE course(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER
)

CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student(student_id),
    course_id INTEGER REFERENCES course(course_id)
)

-- Insert values
INSERT INTO student(student_name,age,email,frontend_mark,backend_mark) 
VALUES ('Sameer',21,'sameer@example.com',48,60),
       ('Zoya',23,'zoya@example.com',52,58),
       ('Nabil',22,'nabil@example.com',37,46),
       ('Rafi',24,'rafi@example.com',41,40),
       ('Sophia',22,'sophia@example.com',50,52),
       ('Hasan',23,'hasan@example.com',43,39)

INSERT INTO course(course_name,credits)
VALUES ('Next.js',3),
       ('React.js',4),
       ('Databases',3),
       ('Prisma',3)

INSERT INTO enrollment(student_id,course_id)
VALUES (1,1),
       (1,2),
       (2,1),
       (3,2);

-- SHOW Tables
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM enrollment;

-- Query 1
INSERT INTO student(student_name,age,email,frontend_mark,backend_mark) VALUES('Noman',24,'noman@example.com',40,60);

-- Query 2
-- For better view
SELECT student_name,course_name FROM student s INNER JOIN enrollment e ON s.student_id=e.student_id
    INNER JOIN course c ON c.course_id=e.course_id 
    WHERE course_name='Next.js';

SELECT student_name FROM student s INNER JOIN enrollment e ON s.student_id=e.student_id
    INNER JOIN course c ON c.course_id=e.course_id 
    WHERE course_name='Next.js';

