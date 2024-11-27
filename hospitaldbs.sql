create database HospitalDB;
use HospitalDB;
create table patients(id int primary key auto_increment,
name varchar(50) not null,
age int not null,
gender varchar(10),
contact varchar(50));
insert into patients values(101,'ramya',20,'female',7305641340),
(102,'durgai',20,'female',89076543210),
(103,'bhava',14,'female',7890516790),
(104,'yoga',17,'male',6354601678);
select*from patients;

#doctors table:;
create table doctors(id int primary key auto_increment,
name varchar(50) not null,
specialization varchar(50) not null);
insert into doctors values(315,'vinoth kumar','cardiologist'),
(314,'subhashini','dermatologist'),
(316,'pavithra','pediatrician'),
(317,'arun deva','orthopedic');
select*from doctors;

#appoinments table:/;
create table appointments(id int primary key auto_increment,
patient_id int,
doctors_id int,
appointment_date date not null,
status enum('scheduled','completed','cancelled'),
foreign key(patient_id) references patients(id),
foreign key(doctors_id) references doctors(id)
);
INSERT INTO appointments VALUES
  (1,101, 315, '2024-11-25', 'scheduled'),
  (2,102, 314, '2024-11-26', 'scheduled'),
  (3,103, 316, '2024-11-27', 'cancelled'),
  (4,104, 317, '2024-11-28', 'scheduled');
  select*from appointments;
  #queries/;
  /*Show appointments with patient and doctor names*/
SELECT
    appointments.id AS appointment_id,
    patients.name AS patient_name,
    doctors.name AS doctor_name,
    appointments.appointment_date,
    appointments.status
FROM
    appointments
JOIN
    patients ON appointments.patient_id = patients.id
JOIN
    doctors ON appointments.doctors_id = doctors.id;
#Count appointments per doctor.;
SELECT
    doctors.name AS doctor_name,
    COUNT(appointments.id) AS appointment_count
FROM
    appointments
JOIN
    doctors ON appointments.doctors_id = doctors.id
GROUP BY
    doctors.name;