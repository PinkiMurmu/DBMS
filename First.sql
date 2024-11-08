--  To show all the databases 
SHOW databases;

-- To create a database
CREATE database <database_name>;

-- To use a database 
use <database_name>;

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

-- Creating another table
create table Staff
  ( staffNo varchar(10) Primary key,
  fName varchar(10),
  lName varchar(10),
  position varchar(15),
  sex char(1),
  DOB date,
  salary int(10),
  branchNo varchar(10));

-- Questionaires
select * from Staff;

select staffNo,fName,lName,salary from Staff;

select * from Staff where salary > 10000;

select * from Staff where salary between 20000 and 30000;

select * from Staff where position = 'Manager' and position = 'Supervisor';
