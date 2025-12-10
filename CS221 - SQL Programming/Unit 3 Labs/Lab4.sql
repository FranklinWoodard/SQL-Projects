/*
The database has three tables for tracking horse-riding lessons:

The Horse table has columns:

ID - primary key
RegisteredName
Breed
Height
BirthDate
The Student table has columns:

ID - primary key
FirstName
LastName
Street
City
State
Zip
Phone
EmailAddress

The LessonSchedule table has  columns:

HorseID - foreign key references Horse
StudentID - foreign key references Student
LessonDateTime - datetime
Primary key is (HorseID, LessonDateTime)

Write a statement that selects a lesson schedule for Feb 1, 2020 with lesson datetimes, student first and last names, and horse registered names. 
Order the results in ascending order by lesson datetime, then by registered name. Unassigned lesson times (student ID is NULL) must appear in the results.

Hint: Perform a three-way join on LessonSchedule, Student, and Horse. Use the DATE() function to convert datetime to date.
*/
DROP TABLE IF EXISTS Horse, Student, LessonSchedule;

CREATE TABLE Horse (
   ID smallint(5) unsigned NOT NULL AUTO_INCREMENT,
   RegisteredName varchar(15) DEFAULT NULL,
   Breed varchar(20) DEFAULT NULL,
   Height decimal(3,1) DEFAULT NULL,
   BirthDate date DEFAULT NULL,
   PRIMARY KEY (ID)
);

CREATE TABLE Student (
   ID smallint(5) unsigned NOT NULL AUTO_INCREMENT,
   FirstName varchar(20) NOT NULL,
   LastName varchar(30) NOT NULL,
   Street varchar(50),
   City varchar(20),
   State char(2),
   Zip mediumint(8) unsigned,
   Phone char(10),
   Email varchar(30),
   PRIMARY KEY (ID)
);

CREATE TABLE LessonSchedule (
   HorseID smallint(5) unsigned NOT NULL,
   StudentID smallint(5) unsigned DEFAULT NULL,
   LessonDateTime datetime NOT NULL,
   PRIMARY KEY (HorseID, LessonDateTime),
   KEY StudentID (StudentID)
);

INSERT INTO Horse
VALUES
   (1,'Babe','Quarter Horse',15.3,'2015-02-10'),
   (2,'Independence','Holsteiner',16.0,'2011-03-13'),
   (3,'Ellie','Saddlebred',15.0,'2016-12-22'),
   (4,'Thunder','Paint',16.1,'2019-05-01'),
   (5,'Alexis','Egyptian Arab',15.9,'2018-02-01'),
   (6,'Space Man','Holsteiner',18.0,'2017-09-21');

INSERT INTO Student
VALUES
   (1,'Karin','White','1234 Blue Rd','Orlando','FL',32825,'4071234678','karin@email.com'),
   (2,'Amir','Saliba','9090 Race St','Orlando','FL',32825,'4079874455','amir@email.com'),
   (3,'Maria','Gonzalez','234 West 3rd St','Oviedo','FL',32821,'4071231122','maria@email.com'),
   (4,'Chales','Dixon','88 East 5th St','Geneva','FL',32732,'4078522585','charles@email.com'),
   (5,'Wei','Zhang','55 North Main St','Geneva','FL',32732,'4073336666','wei@email.com');

INSERT INTO LessonSchedule
VALUES
   (2,4,'2019-02-01 10:00:00'),
   (4,2,'2019-02-01 11:30:00'),
   (4,2,'2019-02-03 11:30:00'),
   (1,NULL,'2020-02-01 09:00:00'),
   (2,NULL,'2020-02-01 08:30:00'),
   (2,NULL,'2020-02-01 09:00:00'),
   (2,NULL,'2020-02-01 10:00:00'),
   (4,NULL,'2020-02-01 09:30:00'),
   (4,NULL,'2020-02-01 10:00:00'),
   (1,1,'2020-02-01 10:00:00'),
   (2,2,'2020-02-01 09:30:00'),
   (1,3,'2020-02-01 08:30:00'),
   (1,4,'2020-02-01 09:30:00'),
   (4,5,'2020-02-01 08:30:00'),
   (4,5,'2020-02-01 09:00:00');
-- Solution
SELECT LessonDateTime, FirstName, LastName, RegisteredName
FROM LessonSchedule 
INNER JOIN Horse ON Horse.ID = LessonSchedule.HorseID
LEFT JOIN Student ON Student.ID = LessonSchedule.StudentID
WHERE DATE(LessonDateTime) = '2020-02-01'
ORDER BY LessonDateTime, RegisteredName ASC;