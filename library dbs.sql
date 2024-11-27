create database libraryDB;
use libraryDB;

/*create table book*/
create table book(id int primary key auto_increment,
title varchar(100) not null,
author varchar(50) not null,
published_year year not null,
genre varchar(30));
insert into book values(1,'the atomic habit','james clear',2018,'non fiction');
insert into book values(2,'the alchemist','paulo coelho',1988,'philosophical fiction'),
(3,'vampire diaries','LJ smith',1991,'fiction'),
(4,'harry potter sorcers stone','JK Rowling','1997','fiction');

select*from book;

/*members table*/

create table members(id int primary key auto_increment,
name varchar(50) not null,
membership_date date not null);
insert into members values(111,'John Doe', '2023-01-15'),
    (222,'Jane Smith', '2023-02-20'),
    (333,'Michael Brown', '2023-03-10'),
    (444,'Emily Davis', '2023-04-05');
   

select*from members;

/*borrowing table*/

create table borrowing(id int primary key auto_increment,
book_id int,
members_id int,
borrow_date date not null,
return_date date,
foreign key (book_id) references book(id),
foreign key(members_id) references members(id));
insert into borrowing values(101, 1, 111, '2018-01-21', '2018-02-21'),
    (102, 2, 222, '2019-12-03', '2020-01-15'),
    (103, 3, 333, '2020-11-08', '2020-12-05'),
    (104, 4, 444, '2024-08-14', '2024-09-08');
select*from borrowing;

/* 3:insert sample data / sample data are inserted */
insert into book values(5,'stranger things suspicious minds','Gwenda bond',2019,'fiction');
select*from book;
insert into members values(555,'Gwenda bond','2019-02-05');
select*from members;
insert into borrowing values(105, 5, 555, '2024-01-21', '2024-02-21');
select*from borrowing;

/*4. queries*/
    /*list all book*/
select*from book;
  /*list all members*/
select*from members;
/*list all members /show borrowing records with member names and book titles*/
select members.name as member_name,book.title as book_title,borrowing.borrow_date,borrowing.return_date from borrowing join members on borrowing.members_id = members.id join book on borrowing.book_id = book.id;
   
/*Count the number of books borrowed by each member*/
select members.name as member_name,COUNT(borrowing.book_id) as book_borrowed from borrowing join members on borrowing.members_id = members.id group by members.id;