

-- SQL : Structured query Language.
-- MySQL
-- PostgreSQL
-- Oracle SQL 
-- IBM DB2

-- SQL sub Languages -> Conception Catagories of the functionality of SQL standard.
-- DDL -> Data definition Language 
-- DML -> Data Manipulation Language
-- DQL -> Data Query Language
-- DCL -> Data Control Language
-- TCL -> Transaction Control Language.

-- database is in the form of Rows and Columns.
-- Table is called "Entity"
-- Columns are called "fileds or attributes"
-- Rows are called "Records or Tuples"
-- DBMS -> Database Management system.
-- uses quried to get the data, or insert the data, oe update data, delete data.
-- create, delete databases and tables.

 -- SQL sub languages -> Conception Catagories of the functionality of SQL standard.
-- DDL -> Data definition Language 
-- its defines the overall data structure. -> tables and columns 
-- Schemas are nothing but a database structure.
-- two meanings -> database structure a schema is like a folder or package in java
-- -> a conceptional term refers to the full structural design of the database.
-- Commands 
-- create -> used to create a new database or tables.
-- alter -> chnages the exiting database or table
-- drop -> removes the database or table
-- truncate -> delete the all the data inisde a table but not the structure of the data(table).

-- DML -> Data Manipulation Langugae
-- its about handling the data inside a table
-- crud operations. -> create, read, update, delete
-- Commands
-- insert -> it will insert the new data or records or rows in table
-- update -> change the record or records in a table
-- delete -> removes the record from a table
-- Select -> Acesses or read the data from a table
-- select statements are called Quries in SQL

-- DQL -> Data Query Language
-- Select -> Acesses or read the data from a table
-- select statements are called Quries in SQL


-- DCL -> Data Control Language 
-- This is used to grant the level of access to the various users to access the database.
-- Commands
-- Grant
-- Revoke


-- TCL -> Transaction Control Language.
-- This is releted to transactions. there are the grouping of releated SQL statemenst to ensure that
-- they succeed or fail collectively.
-- Commands
-- Begin
-- Commit
-- Rollback
-- set

-- MYSQL Datatypes
-- a dataype is a constraint upon a column in table indicating that only that type of data
-- can be held in that column.
-- VARCHAR(size). -> it a set of characters(like string), we can limit the number of chatactors with size.
-- BOOL / BOOLEAN -> stored as a byte value, 0 -> false, any other value is true;
-- INT / INTEGER(size) -> A medium signed interger value -2147483648 to 2147483647.
-- FLOAT(size, decimal) -> size -> defines the max number of digits
-- -> decimal -> defined the number of digits that are after the decimal point.
-- ex: 34.56 -> FLOAT(4, 2)
--  467.5617 -> FLOAT(7,4)
--  467.12
--  046.0
--  600.1
-- DOUBLE(size, decimal) -> it can take larger numbers then float.
-- TIMESTAMP -> specific moemnt in time -> format is yyyy_mm_dd hh:mm:ss
-- single quotes needed -> char, varchar, dates, datetime, timestamp, time, blob, text
-- Not needed for -> int / float / double

-- Null values represent missing or unknown data
-- Null !== 0, Null means empty values.

-- ------------------------------------------------------------------------------------

create database firstDb;

drop database firstDb;

use firstDb;   -- selecting a database.
 
create table person(
id int,
firstname varchar(30),
lastname varchar(30),
phonenumber int(10),
email varchar(30),
address varchar(200),
city varchar(20)
);

show tables;  -- show tables in database.

drop table person; -- delete a table


alter table person drop column city;   -- to delete a column

alter table person rename column phonenumber to mobilenumber; -- rename a column

alter table person add zipcode int(5);  -- add a column 

alter table person modify column address varchar(100);  -- modifys the column type

select * from person;


insert into person(id, firstname, lastname, mobilenumber, email, address, zipcode)
values(1, 'binary', 'logic',57126178, 'binary@logic.com', 'sterling, VA', 20165);

insert into person(id, firstname, lastname) 
values (2, 'java', 'sql');

insert into person(id, firstname, lastname, mobilenumber, email, address, zipcode)
values(3, 'person3', 'personlast3', 123456, 'person3@email.com', 'adddress 3', 54321),
(4,'person4', 'personlast4', 123456, 'person4@email.com', 'adddress 4', 98765 ),
(5, 'person5', 'personlast5', 123456, 'person5@email.com', 'adddress 5', 76543);

select * from person;

-- Different database 
-- Create a table inisde database, atlest 6 columns 
-- Fill 10 rows in a table


-- SQL Constraints 
-- We use it to specify rules for the data in a table
-- NOT NULL -> ensures that a column can not have null values
-- UNIQUE -> ensures that a column can not have duplicate values
-- PRIMARY KEY - combination of NOT NULL and UNIQUE
-- FOREIGN KEY - prevents actions that would destroy links between tables
-- CHECK - Ensures that values in a column satisfies a specific condition
-- DEFAULT - it will set a default value for a column.
-- CREATE INDEX - use it to do indexing which will help us to retrive data from the database very quickly.

-- -----------------------------------------------------------------------------------------------------------------------

create database collage;
use collage;

create table student(
id int primary key,
firstname varchar(30) not null,
lastname varchar(30),
phonenumber bigint(10) unique,
emial varchar(30) not null unique,
address varchar(200)
);

insert into student(id, firstname, lastname, phonenumber, emial, address)
values(1, 'joy', 'jj', 5712450657, 'joy@email.com', 'Sterling, VA');

select * from student;

insert into student(id, firstname, phonenumber, emial)
values(2, 'joy', 5712450656, 'joy2@email.com');

create table student2(
id int primary key,
firstname varchar(30) not null,
lastname varchar(30),
phonenumber bigint(10) unique,
emial varchar(30) not null unique,
address varchar(200)
);
--                                     not null unique chnaged to unique
alter table student2 modify column emial varchar(30) unique; -- change from one condition to another.

alter table student2 drop primary key;   -- remove the primary key condition 

alter table student2 modify column id int primary key; -- add a primary key condition

create table staff(
id int primary key,
name varchar(25) not null,
age int(2) check(age > 18),
city varchar(25) default 'Sterling, VA'
);

insert into staff(id, name, age, city)
values(1, 'rocky', 20, 'Fairfax, VA');

select * from staff;

insert into staff(id, name, age)
values(2, 'jonny', 19);

select * from staff;


create table student3(
id int primary key,
firstname varchar(30) not null,
lastname varchar(30),
phonenumber bigint(10) unique,
emial varchar(30) not null unique,
address varchar(200),
staff_id int,
foreign key(staff_id) references staff(id)
);

select * from student3;
select * from staff;

insert into student3(id, firstname, lastname, phonenumber, emial, address, staff_id)
values(1, 'joy', 'jj', 5712450657, 'joy@email.com', 'Sterling, VA', 2);


create table student4(
id int primary key,
firstname varchar(30) not null,
lastname varchar(30),
phonenumber bigint(10) unique,
emial varchar(30) not null unique,
address varchar(200),
staff_id int
);

select * from student4;

insert into student4(id, firstname, lastname, phonenumber, emial, address, staff_id)
values(1, 'joy', 'jj', 5712450657, 'joy@email.com', 'Sterling, VA', 10);

-- Operators
-- = Equal
-- <> or != not eqaul
-- > Greather than
-- < Less than
-- >= Greather than or equal
-- <= Less than or equal
-- BETWEEN => between an inclusive range
-- LIKE => search for a pattern
-- IN => To specify multiple possible values for a column
-- AND
-- OR
-- NOT

-- -------------------------------------------------------------------------------

create table primary_school_students(
id int primary key, 
f_name varchar(20) not null,
l_name varchar(20),
phone_number bigint(10) unique,
age int(2) check(age <=10),
city varchar(20) default 'VA',
grade varchar(1) not null
);

insert into primary_school_students(id, f_name, l_name, phone_number, age, city, grade)
values(1, 'joy', 'jj', 5712589035, 9, 'MA', 'A'),
(2, 'roy', 'rr', 2345678990, 6, 'OH', 'D'),
(4, 'ana', 'aa', 9876426210, 5, 'NC', 'B'),
(5, 'jim', 'jj', 9876098210, 7, 'MD', 'F'),
(6, 'kim', 'kk', 9876523410, 8, 'DC', 'A'),
(7, 'jonny', 'jo', 9876561210, 4, 'PN', 'C'),
(8, 'rocky', 'ro', 9852943210, 2, 'TX', 'D'),
(9, 'john', 'jh', 6156543210, 9, 'NA', 'A'),
(10, 'rose', 'ro', 2466543210, 10, 'CA', 'E'),
(11, 'sona', 'so', 3456543210, 6, 'FL', 'F');

select * from primary_school_students;

select * from primary_school_students where f_name = 'rose'; 

select * from primary_school_students where f_name != 'rose'; 

select * from primary_school_students where  age between 5 and 10;
select * from primary_school_students where  age >=5 and age<=10;

-- OH, MA, NY

select * from primary_school_students where city in ('OH', 'MA', 'NY');

select * from primary_school_students where  age <=5 ;

-- above 8 years, city = NY
select * from primary_school_students where  age >=8 and city = 'CA';

select * from primary_school_students where age < 8 or grade = 'D';

select * from primary_school_students where age < 8 and grade = 'D';

select * from primary_school_students where f_name like 'r%o_';

-- not OH, MA, NY

select * from primary_school_students where city not in ('OH', 'MA', 'CA');


-- find a students name, age, grade who belongs to ('OH', 'MA', 'CA')

select f_name, age, grade  from primary_school_students  where city in ('OH', 'MA', 'CA');


update primary_school_students set grade = 'A' where id =2;

update primary_school_students set grade = 'A' ;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
set SQL_SAFE_UPDATES= 1; -- safe update mode

select * from primary_school_students order by id desc;


-- age asc

select * from primary_school_students order by age asc;
 
 
select * from primary_school_students order by age asc, id desc;


-- find two youngest students 

select * from primary_school_students order by age asc limit 2;

-- oldest student. 

select * from primary_school_students order by age desc limit 1;

-- find third youngest students

select * from primary_school_students order by age asc limit 2, 1;


create table product(
id int primary key, 
name varchar(20),
price int,
		-- float (total no of digits, digits after decimal points)
ratings float(3,2) -- 1.20, 3,42, 
);

insert into product(id, name, price, ratings)
values (1, 'tv', 100, 4.20),
(2, 'remote', 20, 3.2),
(3, 'laptop', 200, 1.10),
(4, 'phone', 120, 4.65),
(5, 'box', 180, 2.86),
(6, 'tab', 99, 3.35),
(7, 'motor', 87, 3.35),
(8, 'cup', 3, 2.87),
(9, 'plate', 10, 4.56),
(10, 'pellow', 20, 3.56),
(11, 'cap', 50, 4.99),
(12, 'toy', 599, 1.86),
(13, 'car', 1000, 4.98);

select * from product;

-- count the products 

select count(id) as total_products from product;

select sum(price) as total_price from product;

select max(price) from product;

select min(price) from product;

-- lowest ratings for the product 

select min(ratings) from product;

select max(ratings) from product;

select avg(ratings) from product;

-- stats for my table count_products, avg_rating, , total_price, max_price, min_price

select count(id) as count_products, 
avg(ratings) as avg_rating, 
sum(price) as total_price,
max(price) as max_price,
min(price) as min_price
from product;

--  Order table -> reference to member 
--  stats of Order 
--  find the last order 
--  find the biggest order 
--  find the smallest order 
-- sort the  orders based on date
-- sort the orders based on price.
-- provide latest 5 orders. 

 