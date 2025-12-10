/* Prompt:
The Horse table has the following columns:

ID - integer, auto increment, primary key
RegisteredName - variable-length string
Breed - variable-length string, must be one of the following: Egyptian Arab, Holsteiner, Quarter Horse, Paint, Saddlebred
Height - decimal number, must be between 10.0 and 20.0
BirthDate - date, must be on or after Jan 1, 2015
Insert the following data into the Horse table:

RegisteredName	Breed	Height	BirthDate
Babe	Quarter Horse	15.3	2015-02-10
Independence	Holsteiner	16.0	2017-03-13
Ellie	Saddlebred	15.0	2016-12-22
NULL	Egyptian Arab	14.9	2019-10-12
*/

INSERT INTO Horse (RegisteredName, Breed, Height, BirthDate)
VALUES ('Babe', 'Quarter Horse', 15.3, '2015-02-10'),
       ('Independence', 'Holsteiner', 16.0, '2017-03-13'),
       ('Ellie', 'Saddlebred', 15.0, '2016-12-22'),
       (NULL, 'Egyptian Arab', 14.9, '2019-10-12');