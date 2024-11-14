CREATE DATABASE HomeRental;
USE HomeRental;

-- Branch Table
CREATE TABLE Branch (
    branchNo VARCHAR(5) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10)
);

-- Staff Table
CREATE TABLE Staff (
    staffNo VARCHAR(5) PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    position VARCHAR(50),
    sex CHAR(1) CHECK (sex IN ('M', 'F')),
    DOB DATE,
    salary DECIMAL(10, 2),
    branchNo VARCHAR(5),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

-- PropertyForRent Table
CREATE TABLE PropertyForRent (
    propertyNo VARCHAR(5) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10),
    type VARCHAR(50),
    rooms INT,
    rent DECIMAL(10, 2),
    ownerNo VARCHAR(5),
    staffNo VARCHAR(5),
    branchNo VARCHAR(5),
    FOREIGN KEY (ownerNo) REFERENCES PrivateOwner(ownerNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

-- Client Table
CREATE TABLE Client (
    clientNo VARCHAR(5) PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    telNo VARCHAR(15),
    prefType VARCHAR(50),
    maxRent DECIMAL(10, 2)
);

-- PrivateOwner Table
CREATE TABLE PrivateOwner (
    ownerNo VARCHAR(5) PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    address VARCHAR(100),
    telNo VARCHAR(15)
);

-- Viewing Table
CREATE TABLE Viewing (
    clientNo VARCHAR(5),
    propertyNo VARCHAR(5),
    viewDate DATE,
    comment VARCHAR(255),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo)
);

-- Registration Table
CREATE TABLE Registration (
    clientNo VARCHAR(5),
    branchNo VARCHAR(5),
    staffNo VARCHAR(5),
    dateJoined DATE,
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);
