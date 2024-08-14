

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