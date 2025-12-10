CREATE TABLE Horse (
    ID              SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    RegisteredName  VARCHAR(15) NOT NULL,
    Breed           VARCHAR(20),
    Height          DECIMAL(3,1) CHECK (Height BETWEEN 10.0 AND 20.0),
    BirthDate       DATE CHECK (BirthDate >= '2015-01-01'),
    CONSTRAINT chk_breed_valid CHECK ( Breed IN ('Egyptian Arab', 'Holsteiner', 'Quarter Horse', 'Paint', 'Saddlebred'))
);

SHOW COLUMNS FROM HORSE;