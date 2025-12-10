/* Prompt:
The Horse table has the following columns:

ID - integer, primary key
RegisteredName - variable-length string
Breed - variable-length string
Height - decimal number
BirthDate - date
Write a SELECT statement to select the registered name, height, and birth date for only horses 
that have a height between 15.0 and 16.0 (inclusive) or have a birth date on or after January 1, 2020.
*/

SELECT RegisteredName, Height, BirthDate
FROM Horse 
WHERE (Height >= 15.0 AND Height <= 16.0) OR BirthDate >= '2020-01-01';