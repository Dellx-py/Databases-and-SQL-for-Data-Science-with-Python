CREATE DATABASE geografie;
USE geografie;
CREATE TABLE judete ( id INT PRIMARY KEY, nume VARCHAR(255), cod VARCHAR(2));
INSERT INTO judete SET id = 1, nume = 'Constanta', cod = 'CT';
SELECT * FROM judete;

INSERT INTO judete SET id = 2, nume = 'Constanta', cod = 'CT';
SELECT * FROM judete;

DROP TABLE judete;
CREATE TABLE judete ( id INT PRIMARY KEY, nume VARCHAR(255) UNIQUE, cod VARCHAR(2));
INSERT INTO judete SET id = 1, nume = 'Constanta', cod = 'CT';
SELECT * FROM judete;

INSERT INTO judete SET id = 2, cod = 'CT';
SELECT * FROM judete;

INSERT INTO judete SET id = 3, cod = 'CT';
SELECT * FROM judete;

ALTER TABLE judete ADD CONSTRAINT cod_unic UNIQUE(cod);
UPDATE judete SET cod = 'BV' WHERE id = 2;
UPDATE judete SET cod = 'TM' WHERE id = 3;
SELECT * FROM judete;

ALTER TABLE judete ADD CONSTRAINT cod_unic UNIQUE(cod);

INSERT INTO judete SET id = 5, cod = 'CV';
SELECT * FROM judete;

ALTER TABLE judete MODIFY id INT AUTO_INCREMENT;
SELECT * FROM judete;

INSERT INTO judete SET nume = 'Cluj';
SELECT * FROM judete;

