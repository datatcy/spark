use xyz;
SHOW tables;
SHOW VARIABLES LIKE 'local_infile';
--mysql -u username -p

CREATE TABLE circuits (
		circuit_id INT PRIMARY KEY,
        circuit_ref VARCHAR(25),
        name VARCHAR(50),
        location VARCHAR(30),
        country VARCHAR(25),
        latitude FLOAT,
        longitude FLOAT,
        altitude FLOAT,
        data_souurce VARCHAR(10)
        );
        
INSERT INTO circuits (circuit_id,circuit_ref,name,location,country,latitude,longitude,altitude,data_souurce)
VALUES (1,'albert_park','Albert Park Grand Prix Circuit','Melbourne','Australia',-37.8497,144.968,10,'raw')

select * from xyz.circuits;

SET GLOBAL local_infile = 1;
SET SESSION local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/circuit.csv'
INTO TABLE circuits
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(circuit_id,circuit_ref,name,location,country,latitude,longitude,altitude,data_souurce);

select * from circuits;


CREATE TABLE races (
			race_id INT,
            race_year INT,
            round INT,
            circuiit_id INT,
            name VARCHAR(50),
            race_timestamp TIMESTAMP,
            ingestion_date TIMESTAMP
			);

SET GLOBAL local_infile = 1;
SET SESSION local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/race/race.csv'
INTO TABLE races
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(race_id,race_year,round,circuiit_id,name,race_timestamp,ingestion_date);

select * from races;


CREATE TABLE constructor (
				constructor_id INT,
                constructor_ref VARCHAR(50),
                name VARCHAR(50),
                nationality VARCHAR(25),
                ingestion_date TIMESTAMP
							);
                            

SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/constructors/constructors.csv'
INTO TABLE constructor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(constructor_id,constructor_ref,name,nationality,ingestion_date);

select * from constructor;


CREATE TABLE drivers (
					driver_id INT,
                    driver_ref VARCHAR(25),
                    number INT,
                    code VARCHAR(10),
                    name VARCHAR(50),
                    dob DATE,
                    nationality VARCHAR(40),
                    ingestion_date TIMESTAMP
					);
                    
                    
SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/drivers/drivers.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(driver_id,driver_ref,number,code,name,dob,nationality,ingestion_date);


CREATE TABLE results (
			result_id INT,
            race_id INT,
            driver_id INT,
            constructor_id INT,
            number INT,
            grid INT,
            position INT,
            position_text VARCHAR(10),
            position_order INT,
            points DOUBLE,
            laps INT,
            time VARCHAR(25),
            milliseconds INT,
            fastest_lap INT,
			ranks INT,
            fastest_lap_time VARCHAR(25),
            fastest_lap_speed DOUBLE,
            ingestion_date TIMESTAMP
            );
            
SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;
            
LOAD DATA LOCAL INFILE '../tbls/result/result.csv'
INTO TABLE results
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(result_id,race_id,driver_id,constructor_id,number,grid,position,position_text,position_order,points,laps,time,milliseconds,fastest_lap,`part-00000-73edc7da-21b6-479f-abf2-9dc38a588983-c000`ranks,fastest_lap_time,fastest_lap_speed,ingestion_date);

select * from results;

CREATE TABLE pitstops (
				race_id INT,
                driver_id INT,
                stop INT,race_yearteam_namedriver_iddriver_namerace_idposition
                lap INT,
                time VARCHAR(25),
                duration VARCHAR(25),
                milliseconds INT,
                ingestion_date TIMESTAMP
				);

SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/pitstops/pitstops.csv'
INTO TABLE pitstops
FIELDS TERMINATED BY ','
LINEs TERMINATED BY '\n'
IGNORE 1 ROWS
(race_id,race_id,driver_id,stop,lap,time,duration,milliseconds,ingestion_date);

select * from pitstops;

CREATE TABLE laptime (
				race_id INT,
                driver_id INT,
                lap INT,
                position INT,
                time VARCHAR(30),
                milliseconds INT,
                ingestion_date TIMESTAMP
					);
                    
SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/laptimes/laptimes.csv'
INTO TABLE laptime
FIELDS TERMINATED BY ','
LINEs TERMINATED BY '\n'
IGNORE 1 ROWS
(race_id,driver_id,lap,position,time,milliseconds,ingestion_date);

select * from laptime;


CREATE TABLE qualifying (
					qualify_id INT,
                    race_id INT,
                    driver_id INT,
                    constructor_id INT,
                    number INT,
                    position INT,
                    q1 VARCHAR(30),
                    q2 VARCHAR(30),
                    q3 VARCHAR(30)
						);

ALTER TABLE qualifying ADD COLUMN ingestion_date TIMESTAMP;


                        
                        
SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '../tbls/qualifying/qualifying.csv'
INTO TABLE qualifying
FIELDS TERMINATED BY ','
LINEs TERMINATED BY '\n'
IGNORE 1 ROWS
(qualify_id,race_id,driver_id,constructor_id,number,position,q1,q2,q3,ingestion_date);

select * from qualifying;

CREATE TABLE race_results (
					race_year INT,
                    race_name VARCHAR(50),
                    race_date TIMESTAMP,
                    circuit_location VARCHAR(50),
                    driver_name VARCHAR(50),
                    driver_number INT,
                    driver_nationality VARCHAR(40),
                    team VARCHAR(40),
                    grid INT,
                    fastest_lap INT,
                    race_time VARCHAR(50),
                    points DOUBLE,
                    ingested_date TIMESTAMP
						);
                        
SET SESSION local_infile = 1;    
SET GLOBAL local_infile = 1;     

LOAD DATA LOCAL INFILE '../tbls/presentation/race_result_co/race_result_co.csv'
INTO TABLE race_results
FIELDS TERMINATED BY ','
LINES TERMINATED BY'\n'
IGNORE 1 ROWS
(race_year,race_name,race_date,circuit_location,driver_name,driver_number,driver_nationality,team,grid,fastest_lap,race_time,points,ingested_date);

select * from race_results;


CREATE TABLE race_results_agg (
					race_year INT,
                    race_name VARCHAR(50),
                    race_date TIMESTAMP,
                    circuit_location VARCHAR(50),
                    driver_name VARCHAR(50),
                    driver_number INT,
                    driver_nationality VARCHAR(40),
                    team VARCHAR(40),
                    grid INT,
                    fastest_lap INT,
                    race_time VARCHAR(50),
                    points DOUBLE,
                    ingested_date TIMESTAMP
						);
                        
truncate race_results_agg;


CREATE TABLE race_results_driver_standing (
					race_year INT,
                    race_name VARCHAR(50),
                    race_date TIMESTAMP,
                    circuit_location VARCHAR(50),
                    driver_name VARCHAR(50),
                    driver_number INT,
                    driver_nationality VARCHAR(40),
                    team VARCHAR(40),
                    grid INT,
                    fastest_lap INT,
                    race_time VARCHAR(50),
                    points DOUBLE,
                    position INT,
                    ingested_date TIMESTAMP
						);
USE xyz;

CREATE TABLE calculated_race_results
AS
SELECT 
	races.race_year,
	constructor.name as cons_name,
	drivers.name as dri_name,
	results.position,
	results.points,
	11 - results.position as calculatedd_points
    FROM results 
    JOIN drivers ON (results.driver_id = drivers.driver_id)
    JOIN constructor ON (results.constructor_id = constructor.constructor_id)
    JOIN races on (results.race_id = races.race_id)
WHERE results.position <=10;

select * from calculated_race_results;

CREATE OR REPLACE  VIEW race_result
AS
SELECT 
	races.race_year,
	constructor.name as team_name,
    drivers.driver_id,
	drivers.name as driver_name,
	races.race_id,
	results.position,
	results.points,
	11 - results.position as calculatedd_points
    FROM results 
    JOIN drivers ON (results.driver_id = drivers.driver_id)
    JOIN constructor ON (results.constructor_id = constructor.constructor_id)
    JOIN races on (results.race_id = races.race_id)
WHERE results.position <=10;

CREATE TABLE CALCULATED_RACE_RESULTS_UPDATED (
	race_year INT,
	team_name VARCHAR(40),
    driver_id INT,
	driver_name VARCHAR(40),
	race_id INT,
	position INT,
	points INT,
	calculatedd_points INT
    );
    
MERGE INTO CALCULATED_RACE_RESULTS_UPDATED tgt
USING race_result src
ON tgt.driver_id = src.driver_id AND tgt.race_id = src.race_id
WHEN MATCHED THEN
	UPDATE SET  tgt.position = src.position,
				tgt.points = src.points,
                tgt.calculated_points = src.calculated_points
WHEN NOT MATCHEHED THEN
	INSERT (race_year,team_name,driver_name,driver_id,driver_name,race_id,positoin,points,calculated_points) 
    VALUES (race_year,team_name,driver_name,driver_id,driver_name,race_id,positoin,points,calculated_points);
	
use xyz;
CREATE TABLE flt (
			src VARCHAR(25),
            dis VARCHAR(25),
            flt_id INT,
            );

truncate table flt;

INSERT INTO flt (src, dis, flt_id)
VALUES 
    ('Mum', 'Del', 1),
    ('Del', 'Mum', 2),
    ('Blr', 'Mum', 3),
    ('Mum', 'Kol', 4) ;
            
SELECT 
    LEAST(src, dis) AS start_point, 
    GREATEST(src, dis) AS end_point, 
    MIN(flt_id) AS min_flt_id
FROM 
    flt
GROUP BY 
    LEAST(src, dis), GREATEST(src, dis);
							