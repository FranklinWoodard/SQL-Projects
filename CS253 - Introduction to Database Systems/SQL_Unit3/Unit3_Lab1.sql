/* Prompt:
Create a Student table with the following column names, data types, and constraints:
ID - integer with range 0 to 65 thousand, auto increment, primary key
FirstName - variable-length string with max 20 chars, not NULL
LastName - variable-length string with max 30 chars, not NULL
Street - variable-length string with max 50 chars, not NULL
City - variable-length string with max 20 chars, not NULL
State - fixed-length string of 2 chars, not NULL, default "TX"
Zip - integer with range 0 to 16 million, not NULL
Phone - fixed-length string of 10 chars, not NULL
Email - variable-length string with max 30 chars, must be unique
*/
CREATE TABLE Student (
    ID          SMALLINT UNSIGNED AUTO_INCREMENT,
    FirstName   VARCHAR(20) NOT NULL,  
    LastName    VARCHAR(30) NOT NULL,
    Street      VARCHAR(50) NOT NULL,
    City        VARCHAR(20) NOT NULL,
    State       CHAR(2) NOT NULL DEFAULT 'TX',
    Zip         MEDIUMINT UNSIGNED NOT NULL,
    Phone       CHAR(10) NOT NULL,
    Email       VARCHAR(30) UNIQUE,
    PRIMARY KEY (ID)
);