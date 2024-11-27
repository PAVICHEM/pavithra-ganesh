create database pavidbs
use pavidbs;
create table author(author_Id int,name varchar(30),birth_year int,death_year int);
insert into author values(1,"Marcella cole",1983,null);
insert into author values(2,"Lisa Mullins",1891,1950);
insert into author values(3,"Dennis stokes",1935,1994);
insert into author values(4,"randolph vasquez",1957,2004);
insert into author values(5,"daniel branson",1965,1990);
select*from author;
create table book(id int,author_id int,title varchar(100),publish_year int,publishing_house varchar(100),rating varchar(10));
insert into book values(1,null,"soulless girl",2008,"golden albatros",4.3);
insert into book values(2,null,"weak heart",1980,"diarmud inc.",3.8);
insert into book values(3,4,"faith of light",1995,"white cloud press",4.3);
insert into book values(4,null,"memory of hope",2000,"rutis enterprises",2.7);
select*from book;
create table adaptation(book_id int,type varchar(100),title varchar(150),release_year int,rating decimal);
insert into adaptation values(1,"movie","gone with the wolves:the beginning",2008,3);
insert into adaptation values(3,"movie",'Companions Of Tomorrow',2001,4.2);
insert into adaptation values(5,"movie",'Homeless Warrior',2008,4);
insert into adaptation values(2,"movie",'Blacksmith With Silver',2014,4.3);
insert into adaptation values(4,"movie",'Patrons And Bearers',2004,3.2);
select*from adaptation;
create table book_review(book_id int,review varchar(100),author varchar(30));
insert into book_review values(1,'An incredible book','Sylvia Jones');
insert into book_review values(1,'Great although it has some flaws','Jessica Parker');
insert into book_review values(2,'dennis stokes takes the reader for a ride full of emotions','thomas green');
insert into book_review values(3,'incredible craftsmanship of the author','martin freeman');
insert into book_review values(4,'not the best book by this author','jude faith');
insert into book_review values(5,'claudia johnson at her best!','joe marqiz');
insert into book_review values(6,'i cannot recall more captative plot','alexander durham');
select*from book_review;
SELECT name,title,publish_year FROM author JOIN book ON book.id = author.author_Id;
SELECT name,title,publish_year FROM author JOIN book ON author.author_id = book.id WHERE publish_year > 2005;
SELECT book.title AS book_title,adaptation.title AS adaptation_title,book.publish_year,adaptation.release_year FROM book JOIN adaptation ON book.id = adaptation.book_id WHERE adaptation.release_year - book.publish_year >= 4 AND book.rating < adaptation.rating;
SELECT book.title,adaptation.title,adaptation.release_year FROM book LEFT JOIN adaptation ON book.id = adaptation.book_id;
SELECT book.title,publishing_house,adaptation.title,adaptation.type FROM book LEFT JOIN adaptation ON book.id = adaptation.book_id WHERE type = 'movie'OR type IS NULL
SELECT title,name FROM book left join author on author.author_Id=book.id  union SELECT title,name FROM book right join author on author.author_Id=book.id; 




