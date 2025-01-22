--  To show all the databases of your system
SHOW databases;

-- To create a database
CREATE database <database_name>;

--Creating database only if it doesn't exist
CREATE DATABASE IF NOT EXISTS <database_name>;

-- To use a database 
use <database_name>;

--To see the tables
SHOW TABLES;

-- To create a table.. I am doing some of the tasks given in our class
create table Branch 
  ( branchNo varchar(10),
  street varchar(20),
  city varchar(10),
  postcode varchar(10));

-- To make an pre-existing  tuple as primary key
ALTER TABLE Branch
ADD PRIMARY KEY(branchNo);

-- Adding table elements
INSERT INTO Branch values
  ( 'B005','22 Deer Rd','London','SW14EH'),
  ('111b007','16 Argyll St','Aberdeen','AB23SU'),
  ('B003','163 Main St','Glasgow','G119QX'),
  ('B004','32 Manse Rd','Bristol','BS99 LNZ'),
  ('B002','56 Clover Dr','London','NW106EU');

--To delete tables
DROP table <table_name>;

-- Questionaires
select * from Staff;

select staffNo,fName,lName,salary from Staff;

select * from Staff where salary > 10000;

select * from Staff where salary between 20000 and 30000;

select * from Staff where position = 'Manager' and position = 'Supervisor';

--To delete a database
drop database <database_name>;

--To delete database if exists
drop database if exists <database_name>;

-- How to declare foreign key 
CREATE TABLE temp(
  cust_id int,
  FOREIGN KEY (cust_id) references customer(id));

-- Check constraints
CREATE TABLE city (
  id INT PRIMARY KEY ,
  city VARCHAR(50),
  age int,
  constraint age_check check(age>=18 and city='Delhi')); --it won't allow you to enter any age less than 18 and any city other than Delhi.

CREATE TABLE newTab(
  age INT CHECK (age> 18));

-- Distinct keyword
select distinct city from student;

--Limit Clause 
select * from city 
where city="Mumbai"  -- condition on limit
limit 3;  -- it will print only first 3 rows

--Order by Clause
SELECT * FROM city
order by age ASC; -- DESC for decending order

-- Practice Question
select mode, count(customer)
from Payment
group by mode;

-- Practice
-- To change a column name 
alter table client 
change telNo phoneNo varchar(20);

-- To delete a column
alter table client 
drop column lName;

-- To delete rows of certain condition
delete from client 
where maxRent<500;

--Preforming joins on tables
--Joins are the results of cross product of two table and with that some conditions are to be applied.


--Inner join
select column(s)
from tableA as S -- Alias(alternate name)
inner join tableB as C
in S.col_name = C.col_name; --col_name of both the tables are having same kind of data .

-- This will return all the rows from both the tables

--Left join
select column(s)
from tableA
left join tableB
on tableA.col_name = tableB.col_name;

--Right join
select column(s)
from tableA
right join tableB
on tableA.col_name = tableB.col_name;

--To perform full join in mysql we would use union statement (left join union right join)
-- Full join/Full outer join   
-- A full join, also known as a full outer join, is an SQL operation that returns all records from two tables, including matches and non-matches.

select * form tableA as S
left join tableB as C
on S.col_name = C.col_name
union
select * from tableA as  A
right join tableB as B
on A.col_name = B.col_name;

--Left exclusive join
select * from tableA as A
left join tableB as B
on A.col_name = B.col_name
where B.col_name is null;

--Right exclusive join
select * from tableA as A
right join tableB as B
on A.col_name = B.col_name
where A.col_name is null;

--Seif join
select column(s)
from table as A
join table as B        --We are using same table here.
on A.col_name = B.col_name;

-- Union
select column(s) from tableA
union  -- We may write UNION ALL (it will also give us the duplicates)
select column(s) from tableB;

-- SQL sub query
select column(s)
from table_name
where col_name operatoe
(subquery);

select max(marks) from (select *
from student
where city = "Delhi") as temp; --Every derived table must have its own alias. Here temp is a derived table which is being extracted from a table.

-- MySQL Views
create view view1 as 
select rollno,name from student;

select * from view1;
