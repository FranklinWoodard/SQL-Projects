/* Prompt:
Create a Movie table with the following columns:

ID - positive integer with maximum value of 50,000
Title - variable-length string with up to 50 characters
Rating - fixed-length string with 4 characters
ReleaseDate - date
Budget - decimal value representing a cost of up to 999,999 dollars, with 2 digits for cents
 */

CREATE TABLE Movie (
    ID              SMALLINT UNSIGNED CHECK(ID > 0 AND ID <= 50000),  
    Title           VARCHAR(50),
    Rating          CHAR(4),
    ReleaseDate     DATE,
    Budget          DECIMAL(8, 2)
    );


