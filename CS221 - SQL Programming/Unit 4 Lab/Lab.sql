/* 

Step 1. Review column names, data types, and constraints in Initialize.sql.

Step 2. Create the person supertype table:

Create a primary key person_id with data type SMALLINT UNSIGNED. 
Add the common columns of customer and staff. Specify the same names, data types, and constraints.
Add a foreign key constraint on address_id. Specify the same foreign key rules as in customer and staff.
Step 3. Drop common columns from customer and staff:

Drop columns that moved to person in step 1. 
Drop the foreign key constraints on address_id before dropping address_id columns.  
Step 4. Implement IsA relationships in customer and staff:

Drop the existing primary key columns.
Add new primary keys person_id with data type SMALLINT UNSIGNED. 
Implement the IsA relationships as foreign key constraints on person_id. Specify CASCADE foreign key rules. 

HINT: Use ALTER TABLE to add and drop foreign key constraints:

ALTER TABLE customer 
ADD FOREIGN KEY (person_id) REFERENCES person(person_id) 
   ON DELETE CASCADE 
   ON UPDATE CASCADE;


ALTER TABLE customer
DROP FOREIGN KEY fk_customer_address; 

*/
DROP TABLE IF EXISTS customer, staff, address, store, person;

-- Create address table
CREATE TABLE address (
  address_id SMALLINT UNSIGNED NOT NULL,
  address VARCHAR(50) NOT NULL,
  address2 VARCHAR(50),
  district VARCHAR(20) NOT NULL,
  city_id SMALLINT UNSIGNED NOT NULL,
  postal_code VARCHAR(10),
  phone VARCHAR(20),
  location GEOMETRY NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (address_id)
);

-- Create store table
CREATE TABLE store (
  store_id TINYINT UNSIGNED NOT NULL,
  manager_staff_id TINYINT UNSIGNED NOT NULL,
  address_id SMALLINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (store_id)
);

-- Create customer table
CREATE TABLE customer (
  customer_id SMALLINT UNSIGNED NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  rewards_number CHAR(10) UNIQUE,
  email VARCHAR(50),
  address_id SMALLINT UNSIGNED,
  active TINYINT NOT NULL DEFAULT '1',
  create_date DATETIME NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (customer_id),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Create staff table
CREATE TABLE staff (
  staff_id TINYINT UNSIGNED NOT NULL,
  first_name VARCHAR(45) NOT NULL, -- Common with customer
  last_name VARCHAR(45) NOT NULL, -- Common with customer
  address_id SMALLINT UNSIGNED, -- Common with customer
  picture BLOB, 
  email VARCHAR(50), -- Common with customer
  store_id TINYINT UNSIGNED NOT NULL, 
  username VARCHAR(16) UNIQUE, 
  password VARCHAR(40), 
  active TINYINT NOT NULL DEFAULT '1', -- Common with customer
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Common with customer
  PRIMARY KEY (staff_id),
  CONSTRAINT fk_staff_address FOREIGN KEY (address_id) REFERENCES address (address_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES store (store_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Solution

-- Create person table
CREATE TABLE person (
person_id SMALLINT UNSIGNED NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
email VARCHAR(50),
address_id SMALLINT UNSIGNED,
active TINYINT NOT NULL DEFAULT '1',
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (person_id),
CONSTRAINT fk_person_address FOREIGN KEY (address_id) REFERENCES address (address_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Alter table statements

ALTER TABLE staff
DROP FOREIGN KEY fk_staff_address,
DROP COLUMN first_name,
DROP COLUMN last_name,
DROP COLUMN email,
DROP COLUMN address_id;

ALTER TABLE customer
DROP FOREIGN KEY fk_customer_address,
DROP COLUMN first_name,
DROP COLUMN last_name,
DROP COLUMN email,
DROP COLUMN address_id;

ALTER TABLE customer DROP PRIMARY KEY;
ALTER TABLE customer DROP COLUMN customer_id;
ALTER TABLE customer
ADD COLUMN person_id SMALLINT UNSIGNED NOT NULL,
ADD PRIMARY KEY (person_id),
ADD CONSTRAINT fk_customer_person FOREIGN KEY (person_id)
REFERENCES person (person_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE staff DROP PRIMARY KEY;
ALTER TABLE staff DROP COLUMN staff_id;
ALTER TABLE staff
ADD COLUMN person_id SMALLINT UNSIGNED NOT NULL,
ADD PRIMARY KEY (person_id),
ADD CONSTRAINT fk_staff_person FOREIGN KEY (person_id)
REFERENCES person (person_id)
ON DELETE CASCADE
ON UPDATE CASCADE;