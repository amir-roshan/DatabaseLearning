CREATE DATABASE ClassworkPractice;

USE ClassworkPractice;

CREATE TABLE University(
    UniversityID INT PRIMARY KEY,
    UniName VARCHAR(50) NOT NULL
)


CREATE TABLE PARENT(
	ParentID VARCHAR(50),
	ParentName VARCHAR(50),
	CONSTRAINT PK__PARENT__PARENTID PRIMARY KEY (ParentID)
)

CREATE TABLE PhoneType(
	PhoneTypeId INT,
	PhoneName VARCHAR(10) NOT NULL,
	 /* Having a constraint would help us to debgu esier */
	CONSTRAINT PK__PHONETYPE__PHONETYPEID PRIMARY KEY (PhoneTypeId)
)

CREATE TABLE Employee(
    EmpID INT IDENTITY(1,5) PRIMARY KEY,
    FirstName   VARCHAR(20),
    LastName VARCHAR(20),
    DOB DATE
)

INSERT INTO University (UniversityID, UniName)
VALUES 
	(2, 'SFU'),
	(3, 'BCIT'),
	(4, 'Langara');

INSERT INTO PhoneType(PhoneTypeId, PhoneName)
VALUES
	(1, 'Home'),
	(2, 'Work'),
	(3, 'Cell')

INSERT INTO Employee(FirstName, LastName, DOB)
VALUES
	('Anderson', 'Bailles', '2000-09-01'),
	('Griffith', 'O''riely', '1999-8-5');

UPDATE University
SET UniName = 'British Columbia Institute of Technology'
WHERE UniversityID = 3;

DELETE FROM University 
WHERE UniversityID = 4;

CREATE TABLE Child (
ChildId VARCHAR(50) PRIMARY KEY ,
ChildName VARCHAR(50) NOT NULL ,
ParentId VARCHAR(50) FOREIGN KEY REFERENCES Parent(ParentId)
);

ALTER TABLE UNIVERSITY ALTER COLUMN UniName varchar(75);

SELECT *
FROM UNIVERSITY;