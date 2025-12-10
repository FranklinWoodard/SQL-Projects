/* Prompt:
The database contains a Horse table, with columns:

ID - integer, primary key
RegisteredName - variable-length string
The database contains a Student table, with columns:

ID - integer, primary key
FirstName - variable-length string
LastName - variable-length string
Create a third table, named LessonSchedule, with columns:

HorseID - integer with range 0 to 65 thousand, not NULL, foreign key references Horse(ID)
StudentID - integer with range 0 to 65 thousand, foreign key references Student(ID)
LessonDateTime - date/time, not NULL
Primary key is (HorseID, LessonDateTime)
If a row is deleted from Horse, the rows with the same horse ID should be deleted from LessonSchedule automatically.

If a row is deleted from Student, the same student IDs should be set to NULL in LessonSchedule automatically.
*/
CREATE TABLE LessonSchedule (
    HorseID         SMALLINT UNSIGNED NOT NULL,
    StudentID       SMALLINT UNSIGNED, 
    LessonDateTime  DATETIME NOT NULL,
    PRIMARY KEY (HorseID, LessonDateTime),
    FOREIGN KEY (HorseID) REFERENCES Horse(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Student(ID)
        ON DELETE SET NULL
);