/*
The Movie table has the following columns:

ID - integer, primary key
Title - variable-length string
Genre - variable-length string
RatingCode - variable-length string
Year - integer

The Rating table has the following columns:

Code - variable-length string, primary key
Description - variable-length string

Write a statement that selects movie title, year, and description. Select all movies, including movies with no rating code.

Hint: Perform a LEFT JOIN on Movie and Rating, matching the RatingCode and Code columns.
*/
DROP TABLE IF EXISTS Movie, Rating;

CREATE TABLE Movie (
   ID INT unsigned NOT NULL AUTO_INCREMENT,
   Title VARCHAR(30) DEFAULT NULL,
   Genre VARCHAR(20) DEFAULT NULL,
   RatingCode VARCHAR(5) DEFAULT NULL,
   Year INT DEFAULT NULL,
   PRIMARY KEY (ID)
);
 
CREATE TABLE Rating (
   Code VARCHAR(5) NOT NULL,
   Description VARCHAR(30) NOT NULL,
   PRIMARY KEY (Code)
);

INSERT INTO Movie
VALUES
   (1,'Becoming','Documentary','PG',2020),
   (2,'Den of Thieves','Action','R',2019),
   (3,'Arctic Dogs','Family','PG',2019),
   (4,'Dangerous Lies','Action',NULL,2020),
   (5,'All Day and a Night','Drama','R',2020),
   (6,'Extraction','Action','R',2020),
   (7,'Madagascar: Escape 2 Africa','Family','PG',2008),
   (8,'The Willoughbys','Family','PG',2020),
   (9,'Despicable Me','Family','PG',2010),
   (10,'Armed Response','Action','R',2017);

INSERT INTO Rating
VALUES
   ('G','General Audiences'),
   ('PG','Parental Guidance Suggested'),
   ('PG-13','Parents Strongly Cautioned'),
   ('R','Restricted');
   
-- Solution
SELECT Title, Year, Description
FROM Movie
LEFT JOIN Rating
ON Movie.RatingCode = Rating.Code;