SHOW DATABASES;

USE personal;
CREATE TABLE people( id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(255), 
    last_name VARCHAR(255)
    

);
SELECT * FROM people;

ALTER TABLE people ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;
SELECT * FROM people;



INSERT INTO people SET first_name = 'Duck', last_name = 'Donald';
INSERT INTO people SET first_name = 'Mouse', last_name = 'Mickey';
INSERT INTO people SET first_name = 'Duck', last_name = 'Daffy';
INSERT INTO people SET first_name = 'Mouse', last_name = 'Minnie';
SELECT * FROM people;

DELETE FROM people WHERE id = 2;

ALTER TABLE people ADD COLUMN varsta INT;
SELECT * FROM people;
ALTER TABLE people ADD COLUMN retea VARCHAR(255) DEFAULT 'Disney';
SELECT * FROM people;

ALTER TABLE people ADD COLUMN culoare VARCHAR(255), ADD dimensiune INT;
SELECT * FROM people;