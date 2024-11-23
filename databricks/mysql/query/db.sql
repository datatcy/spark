CREATE database db;

use db;

CREATE table db.person(
id int,
email varchar(30)
);

SELECT * from db.person;

LOAD DATA  LOCAL INFILE '../database/5_person.csv'
INTO TABLE db.person
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id,email);

ALTER table db.person MODIFY COLUMN email varchar(30) ;
DROP TABLE db.person;
USE db;

SET SQL_SAFE_UPDATES = 0;
with one as (select id,email, row_number() over (partition by email order by id) as rnumber from db.person)
DELETE FROM db.person where id in (select id from one where rnumber >= 2);

TRUNCATE TABLE db.person;

CREATE table db.salary (
	id integer,
    name char,
    sex char,
    salary integer
    );

SELECT * FROM db.salary;

LOAD DATA  LOCAL INFILE '../database/21_salary.csv'
INTO TABLE db.salary
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id,name,sex,salary);

SET SQL_SAFE_UPDATES = 0;
UPDATE db.salary
SET sex = 
    CASE 
        WHEN sex = 'm' THEN 'f'
        WHEN sex = 'f' THEN 'm'
    END;
