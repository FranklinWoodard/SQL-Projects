-- Creating strong entity 'phone'
CREATE TABLE phone ( 
    phone_id        INT PRIMARY KEY,
    country_code    INT NOT NULL,
    phone_number    INT NOT NULL,
    phone_type      VARCHAR(12)
);

-- Add phone_id and foreign keys to customer, staff, and store tables
ALTER TABLE customer
ADD COLUMN phone_id INT,
ADD FOREIGN KEY (phone_id) REFERENCES phone(phone_id) 
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE staff 
ADD COLUMN phone_id INT,
ADD FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE store 
ADD COLUMN phone_id INT,
ADD FOREIGN KEY (phone_id) REFERENCES phone(phone_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Remove the phone table from the address table
ALTER TABLE address
DROP phone;

