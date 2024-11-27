create database employeedbs;
use employeedbs;
drop table employee;
create table employee( 
employee_id int primary key auto_increment,
full_name varchar(20) CHECK (length(full_name)between 3 and 20) NOT NULL,
age INT CHECK (age >= 18 and age <= 65) DEFAULT 25,
salary INT CHECK (salary > 15000),
mobile_no VARCHAR(15),  
CONSTRAINT mobile_no CHECK (CHAR_LENGTH(mobile_no) = 10 AND mobile_no REGEXP '^[0-9]{10}$'),
pan_no varchar(10) UNIQUE,
gender varchar(50) DEFAULT "not specified" ,
city varchar(50) NOT NULL DEFAULT "chennai",
email_id varchar(50) UNIQUE,
COUNTRY VARCHAR(25) DEFAULT "INDIA",
department_id INT, foreign key (department_id) references chem_dept(dept_id));

select*from employee;

/*task 1:age constraint*/ 

 insert into employee values(001,"saikavi",2,85000,9092536942,"SAIVK17631","FEMALE","VILLUPURAM","saikavivk3110@gmail.com","INDIA",001);/*THE AGE OF "SAIKAVI" IS GIVEN A 2 IS I LESSER THEN THE AGE CONSTRAINT GIVEN BEFORE HENCE IS SHOWN ERRORAS EMPLOYEE_CHK VOILATED*/
insert into employee values(001,"saikavi",18,85000,9092536942,"SAIVK17631","FEMALE","VILLUPURAM","saikavivk3110@gmail.com","INDIA",001); /*THE AGE OF :"SAIKAVI IS UPDATED AS 18 AND THE ERROR IS RESOLUTED*/

select*from employee;

/*task 2:gender constraint*/
insert into employee values(002,"divya dharshini",26,85000,8825984486,"DIVYA15048","UNKNOWN","Chennai","divyadharshini15@gmail.com","INDIA",003);
insert into employee values(002,"divya dharshini",26,85000,8825984486,"DIVYA15048","FEMALE","CHENNAI","divyadharshini15@gmail.com","INDIA",003);

select*from employee;

/*task 3:salary constraint*/
insert into employee values(003,"bakyalakshmi",20,10000,8925117213,"BAKYA25483","FEMALE","CHENNAI","BAKYALAKSHMI29@gmail.com","INDIA",011);
insert into employee values(003,"bakyalakshmi",20,25000,8925117213,"BAKYA25483","FEMALE","CHENNAI","BAKYALAKSHMI29@gmail.com","INDIA",011);

select*from employee;

/*task 4:pan unique constraint*/
insert into employee values(004,"Vijay S M",42,60000,9092567987,"BAKYA25483","MALE","CUDDALORE","vijaysamuvi@gmail.com","INDIA",017);
insert into employee values(004,"Vijay S M",42,60000,9092567987,"VIJAY17631","MALE","CUDDALORE","vijaysamuvi@gmail.com","INDIA",017);

select*from employee;

/*task 5:city default value*/

insert into employee(employee_id,full_name,age,salary,mobile_no,pan_no,gender,email_id,country,department_id)
 values (005,"jayashanthi",46,65000,9841655335,"JAYAS12345","FEMALE","jayashanthi413@gmail.com","INDIA",001);

SELECT*FROM employee;

/*task 6: email unique constraint*/
insert into employee values(006,"G kala vijay",40,85000,9092568427,"KALAV17631","FEMALE","NAMAKKAL","vijaysamuvi@gmail.com","INDIA",003);
insert into employee values(006,"G kala vijay",40,85000,9092568427,"KALAV17631","FEMALE","NAMAKKAL","kalavijay1706@gmail.com","INDIA",003);

select*from employee;

/*task 7:Not Null Constraint on Fullname*/
insert into employee values(007,NULL,21,85000,7384595426,"AKSHA10124","FEMALE","COIMBATORE","akshayaks@gmail.com","INDIA",011);
insert into employee values(007,"Akshaya K S",21,85000,7384595426,"AKSHA10124","FEMALE","COIMBATORE","akshayaks@gmail.com","INDIA",011);

select*from employee;

/*task 8:Default Value for Gender*/
drop table employee;
 insert into employee values (008,"Antony george V",56,80000,6358742945,"ANTOG09068",default,"KARAIKAL","antonygeorge4phy@gmail.com","INDIA",017); 
 
 /*task 9:Mobile Number Constraint*/
insert into employee values(009,"kiran R",53,75000,73845594262,"KIRAN11064","MALE","CHENNAI","kiran4u@gmail.com","INDIA",001);
insert into employee values(009,"kiran R",53,75000,73845594,"KIRAN11064","MALE","CHENNAI","kiran4u@gmail.com","INDIA",001);
insert into employee values(009,"kiran R",53,75000,7384559426,"KIRAN11064","MALE","CHENNAI","kiran4u@gmail.com","INDIA",001);

select*from employee;
  
/*task 10: Department Foreign Key Constraint*/
drop table chem_dept;
create table chem_dept(dept_id int primary key, name varchar(30));
insert into chem_dept values(1,"lakshmi priya");
insert into chem_dept values(3,"bakyalakshmi");
insert into chem_dept values(11,"ramyasri");
insert into chem_dept values(17,"pavithra");

select*from chem_dept;

/*task 11: positive age Constraint*/

insert into employee values(010,"saravanan V",-43,70000,7384349426,"SARAV14115","MALE","CHENNAI","saravananpet@gmail.com","INDIA",003);
insert into employee values(010,"saravanan V",43,70000,7384349426,"SARAV14115","MALE","CHENNAI","saravananpet@gmail.com","INDIA",003);

select*from employee;

/*task 12:Fullname Length Constraint */
insert into employee values(011,"ramyasribhuvaneshwari",21,18000,7384342226,"RAMYA11065","FEMALE","CHENNAI","ramyasribhuva@gmail.com","INDIA",011);
insert into employee values(011,"ramyasri",21,18000,7384342226,"RAMYA11065","FEMALE","CHENNAI","ramyasribhuva@gmail.com","INDIA",011);

select*from employee;

/*task 13:city not null Constraint */
insert into employee values(012,"latha ravi",62,80000,7345342226,"LATHA11065","FEMALE",NULL,"ramyasribhuva@gmail.com","INDIA",017);
insert into employee values(012,"latha ravi",62,80000,7345342226,"LATHA11065","FEMALE","CHENNAI","lathalovesravi@gmail.com","INDIA",017);

select*from employee;

/*task 14:Age Default Value */
insert into employee values(013,"ganesh",DEFAULT,100000,7345342656,"GANES11015","MALE","CHENNAI","pavithrafashion@gmail.com","INDIA",001);

select*from employee;

/*task 15:Salary Between Range Constraint*/
alter table employee add constraint CHECK (salary >= 15000 and salary <= 100000);
insert into employee values(014,"preethi",21,1100000,6574128395,"PREET03044","FEMALE","CHENGALPATTU","preethijeevarathinam@gmail.com","INDIA",003);
insert into employee values(014,"preethi",21,100000,6574128395,"PREET03044","FEMALE","CHENGALPATTU","preethijeevarathinam@gmail.com","INDIA",003);

select*from employee;

/*task 16: Country Default Value Constraint*/
insert into employee values(015,"aathish",22,100000,6573928395,"AATHI03044","MALE","CHENGALPATTU","aathishpree@gmail.com",default,011);

select*from employee;


