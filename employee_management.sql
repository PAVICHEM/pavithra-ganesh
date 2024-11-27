create database employeemanagement;
use employeemanagement
create table departments(dept_id int primary key auto_increment,name varchar(50) not null);
insert into departments values (1,"IT");
insert into departments values (2,"HR");
insert into departments values (3,"MARKETING");
insert into departments values (4,"TESTING");
select*from departments;
create table employees(id int primary key auto_increment,
name varchar(50) not null,
age int not null,
gender varchar(10) not null,
salary int not null check(salary > 30000),
dept_id int, foreign key(dept_id) references departments(dept_id));
insert into employees values(01,"Pavithra ganesh",20,"female",50000,4);
insert into employees values(02,"Ramyasri Bhuvaneshwari",21,"female",51000,3);
insert into employees values(03.,"Bakyalakshmi",21,"female",55000,2);
insert into employees values(04,"Lakshmi priya",21,"female",53000,4);
insert into employees values(05,"jagatheeshwaran",21,"male",51000,1);
insert into employees values(06,"Vijay",40,"male",60000,4);
select*from employees;
create table projects(id int primary key auto_increment,
name varchar(50) not null,
budget int not null check(budget > 10000));
insert into projects values(1,'project-A',15000),(2,'project-B',16000),(3,'project-C',17000),(4,'project-D',18000);
insert into projects values(5,'project-E',19000),(6,'project-F',20000);
select*from projects;
create table employee_projects(employee_id int, foreign key(employee_id) references employees(id),
project_id int,foreign key(project_id) references projects(id),
primary key (employee_id,project_id));
insert into employee_projects values(001,1),(002,2),(003,3),(004,4);
insert into employee_projects values(005,5),(006,6);
select*from employee_projects;
create table attendance(id int primary key auto_increment,
employee_id int, foreign key(employee_id) references employees(id),
date date not null,
status enum('present','absent','on leave'));
insert into attendance values(1,01,'2024-10-1','present'),(2,02,'2024-10-2','present'),(3,03,'2024-10-3','absent'),(4,04,'2024-10-4','present'),(5,05,'2024-10-5','absent'),(6,06,'2024-10-6','present');

 /*queries*/
 
 /*1:retrieve all the employees*/
 select*from employees; 
 
/*2:Retrieve all employees in the 'IT' department*/
 select employees.name,employees.salary from employees join departments on employees.dept_id = departments.dept_id where departments.name = 'IT'; 
 
 /*3: shows the names of the employees and the projects they are working on*/
select employees.name,projects.name from employees join projects on employees.id = projects.id; 

/* 4:count the number of employees in each department*/
SELECT departments.name, COUNT(*) AS employee_count
FROM employees
JOIN departments ON employees.dept_id = departments.dept_id
GROUP BY departments.name;

/* 5: Find employees with a salary greater than 50000.*/
select name,salary from employees where salary > 50000;

/* 6: Get attendance records for a specific employee*/
select*from attendance where employee_id in (1,2,3,4,5,6);
 
 /*UPDATE RECORDS*/
 /* 1: Increase the salary of employees in the 'HR' department by 10%*/
 update employees join departments on employees.dept_id = departments.dept_id set employees.salary = employees.salary* 1.10 where departments.name = 'HR'; 
 SELECT employees.name, employees.salary, departments.name AS department FROM employees
JOIN departments ON employees.dept_id = departments.dept_id
WHERE departments.name = 'HR';

/* 2: Change the department of an employee*/
UPDATE employees
SET dept_id = 3
WHERE id = 2;
SELECT employees.name, departments.name AS department
FROM employees
JOIN departments ON employees.dept_id = departments.dept_id
WHERE employees.id = 2;

/*DELETE RECORDS*/
/* 1: Remove an employee who has resigned*/
-- Step 1: Remove employee from employee_projects table
DELETE FROM employee_projects WHERE employee_id = 004;

-- Step 2: Remove employee attendance records
DELETE FROM attendance WHERE employee_id = 004;

-- Step 3: Remove employee from employees table
DELETE FROM employees WHERE id = 004;

select*from employees;

 /* 2: Delete a project that is completed*/
 -- Step 1: Remove references from employee_projects table
DELETE FROM employee_projects WHERE project_id = 4;

-- Step 2: Remove the project from the projects table
DELETE FROM projects WHERE id = 4;

select*from employee_projects

/*Constraints and Modifications*/
employees
/* 1: Add a unique constraint to the `email` column in `Employees` table*/
 ALTER TABLE employees
ADD COLUMN email VARCHAR(100),
ADD CONSTRAINT unique_email UNIQUE (email);
UPDATE employees
SET email = 'pavithrache28@gmail.com'
WHERE id = 1;
UPDATE employees
SET email = 'ramyasri.bhuvaneshwari@gmail.com'
WHERE id = 2;
UPDATE employees
SET email = 'bakyalakshmi@gmail.com'
WHERE id = 3;
UPDATE employees
SET email = 'lakshmi.priya@gmail.com'
WHERE id = 4;
UPDATE employees
SET email = 'jagatheeshwaran1304@gmail.com.com'
WHERE id = 5;
UPDATE employees
SET email = 'vijaysamuvi17@gmail.com'
WHERE id = 6;

/*Ensure `age` is always greater than 18*/
ALTER TABLE employees
ADD CONSTRAINT check_age CHECK (age > 18);

insert into employees values (07,"kalavijay",16,"female",50000,4,"kalavijay1706@gmail.com"); /*as age is given as 16 it shows AS CHECK_AGE constraint is voilated*/
insert into employees values (07,"kalavijay",40,"female",50000,4,"kalavijay1706@gmail.com");

/*Add a default value 'Unknown' to `gender` if not specified*/
ALTER TABLE employees
MODIFY gender VARCHAR(10) DEFAULT 'Unknown'
 insert into employees values (08,"antony george",56,default,50000,3,"antonygeorge@gmail.com");
 
 select*from employees;



