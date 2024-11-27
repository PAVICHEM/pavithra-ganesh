create database Learningdb;
use learning;
create table courses(id int primary key auto_increment,
title varchar(100) not null,
description text );
insert into courses values(101,'Introduction to Programming', 'This course covers the basics of programming, including variables, loops, and functions. Suitable for beginners.'),
(102,'Database Management Systems', 'An in-depth look at how relational databases work, including SQL, normalization, and indexing techniques.'),
(103,'Web Development Fundamentals', 'Learn how to build and design websites using HTML, CSS, and JavaScript. A beginner-friendly introduction to web technologies.'),
(104,'Data Science and Machine Learning', 'An advanced course focused on the techniques and tools for data analysis, machine learning algorithms, and predictive modeling.');
select*from courses;

#instructors table;
create table instructors(id int primary key auto_increment,
name varchar(50) not null,
expertise varchar(50) not null);
insert into instructors values(1101,'pavithra','computer science'),
(1102,'gopika','database administration'),
(1103,'durgai','web development'),
(1104,'neeraj','data science');
select*from instructors;
#students table;
create table students(id int primary key auto_increment,
name varchar(50) not null,
email varchar(50) not null);
insert into students values(111,'Vinoth kumar','vinothkumar@gmail.com'),
(222,'arun deva','arundeva008@gmail.com'),
(333,'subhasini','subhashini@gmail.com'),
(444,'ayesha','ayesha099@gmail.com');
select*from students;
#enrolments table;
create table enrollments(students_id int primary key auto_increment,
courses_id int,
enrollments_date date not null,
foreign key(students_id) references students(id),
foreign key(courses_id) references courses(id)
);
insert into enrollments values(111,101,'2024-01-10'),
(222,102,'2024-01-15'),
(333,103,'2024-02-01'),
(444,104,'2024-02-05');

/*Show enrollments with student names and course titles*/
SELECT
    students.name AS student_name,
    courses.title AS course_title,
    enrollments.enrollments_date AS enrollment_date
FROM
    enrollments
JOIN
    students ON enrollments.students_id = students.id
JOIN
    courses ON enrollments.courses_id = courses.id;

/*Count the number of students enrolled in each course*/
select
courses.title as courses_title,
count(enrollments.students_id) as student_count
from
enrollments
join
courses on enrollments.courses_id = courses.id
group by
courses.title;