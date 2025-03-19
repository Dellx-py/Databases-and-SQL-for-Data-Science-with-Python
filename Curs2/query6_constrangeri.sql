SHOW DATABASES;

CREATE DATABASE online_store;
USE online_store;
CREATE TABLE computer_parts ( id INT PRIMARY KEY AUTO_INCREMENT, 
cod VARCHAR(5), 
tip VARCHAR(255) DEFAULT 'Electronic', 
nume VARCHAR(100) UNIQUE NOT NULL,
pret  DECIMAL (7,2)
);


SELECT * FROM computer_parts;

INSERT INTO computer_parts SET nume = 'cablu', pret = 54.23;

