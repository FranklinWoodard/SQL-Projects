/*
The Horse table has the following columns:

ID - integer, primary key
RegisteredName - variable-length string
Breed - variable-length string
Height - decimal number
BirthDate - date

Write a statement that selects the registered name and height for only horses that have an above average height. 
Order the results by height (ascending).

Hint: Use a subquery to find the average height.
*/
DROP TABLE IF EXISTS Horse;

CREATE TABLE Horse (
   ID smallint(5) unsigned NOT NULL AUTO_INCREMENT,
   RegisteredName varchar(15) DEFAULT NULL,
   Breed varchar(20) DEFAULT NULL,
   Height decimal(3,1) DEFAULT NULL,
   BirthDate date DEFAULT NULL,
   PRIMARY KEY (ID)
);

INSERT INTO Horse
VALUES
   (1,'Babe','Quarter Horse',15.3,'2015-02-10'),
   (2,'Independence','Holsteiner',16.0,'2011-03-13'),
   (3,'Ellie','Saddlebred',15.0,'2016-12-22'),
   (4,'Thunder','Paint',16.1,'2019-05-01'),
   (5,'Alexis','Egyptian Arab',15.9,'2018-02-01'),
   (6,'Space Man','Holsteiner',18.0,'2017-09-21');
-- Solution
SELECT RegisteredName, Height
FROM Horse
WHERE Height > (
    SELECT AVG(Height)
    FROM Horse
)
ORDER BY Height;