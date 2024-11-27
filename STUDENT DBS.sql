create database studentDB;
use studentDB;
create table students(id int primary key auto_increment,
name varchar(50) not null,
age int not null,
email varchar(50) not null unique);
insert into students value(1101,'preethi',18,'preethijevarathinam@gmail.com');
select*from students;
insert into students values(1102,'abitha',19,'abithagajendran@gmail.com');
insert into students values(1103,'priya',20,'priyasweetie@gmail.com'),
(1104,'ishwariya',21,'ishuu@gmail.com');
insert into students values(1105,'pavithra g',20,'pavithrache28@gmail.com');

/*courses table*/
create table courses(id int primary key auto_increment,
name varchar(50) not null);
insert into courses values(101,'maths'),
(102,'chemistry'),
(103,'physics'),
(104,'biochemistry');
select*from courses;

/*enrollments table*/
create table enrollments(students_id int,
courses_id int,
grade char(1),
primary key(students_id,courses_id),
foreign key (students_id) references students(id),
foreign key (courses_id) references courses(id));
insert into enrollments values(1101,101,'A'),
(1102,102,'B'),
(1104,104,'D'),
(1103,103,'C'),
insert into enrollments values(1105,102,'A');
select*from enrollments;

/*INSERT SAMPLE DATA: /DATA ARE INSERTED*/
insert into students values(1106,'ramyasri',20,'ramyasribhuva@gmail.com');
insert into enrollments values(1106,102,'B');



/*QUERIES*/
/*LIST ALL STUDENTS*/
SELECT*from students;

/*show the names of students and the courses they are enrolled in*/
 select students.name as student_name,courses.name as course_name from enrollments join students on enrollments.students_id = students.id join courses on enrollments.courses_id = courses.id;
 
  /*Count the number of students in each course*/
  select courses.name as course_name, count(enrollments.students_id) as students_count from enrollments join courses on enrollments.courses_id = courses.id group by courses.name;