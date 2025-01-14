CREATE DATABASE raw;
CREATE DATABASE IF NOT EXISTS EXTERNALDB
LOCATION 'location for hive table other than default location'
USE raw;

CREATE TABLE IF NOT EXISTS CIRCUTS (
		circuit_id INT PRIMARY KEY,
        circuit_ref VARCHAR(25),
        name VARCHAR(50),
        location VARCHAR(30),
        country VARCHAR(25),
        latitude FLOAT,
        longitude FLOAT,
        altitude FLOAT,
        data_souurce VARCHAR(10)
        ) 
        USING CSV
        OPTIONS (path '../source/circuits.csv', header true);
        
CREATE TABLE IF NOT EXISTS RACES (
		race_id INT,
		race_year INT,
		round INT,
		circuiit_id INT,
		name VARCHAR(50),
		race_timestamp TIMESTAMP,
		ingestion_date TIMESTAMP
		)
        USING CSV
        OPTIONS (PATH '../source/races.csv', header true);
        
CREATE TABLE IF NOT EXISTS CONSTRUUCTOR (
		constructor_id INT,
		constructor_ref VARCHAR(50),
		name VARCHAR(50),
		nationality VARCHAR(25),
		ingestion_date TIMESTAMP
        )
        USING JSON
        OPTIONS(PATH '../source/constructors.json');
        
CREATE TABLE IF NOT EXISTS  drivers (
		driver_id INT,
		driver_ref VARCHAR(25),
		number INT,
		code VARCHAR(10),
		name STRUCT <forename: VARCHAR(25),surname:VARCHAR()25>,
		dob DATE,
		nationality VARCHAR(40),
		ingestion_date TIMESTAMP
		)
        USING JSON
        OPTIONS(PATH '../source/drivers.json');
        
CREATE TABLE IF NOT EXISTS RESULTS (
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
		)
        USING JSON
        OPTIONS(PATH '../source/results.json');
        
CREATE TABLE IF NOT EXISTS PITSTOPS (
		race_id INT,
		driver_id INT,
		stop INT,
		lap INT,
		time VARCHAR(25),
		duration VARCHAR(25),
		milliseconds INT,
		ingestion_date TIMESTAMP
		)
        USING JSON
        OPTIONS(PATH '../source/pit_stops.json',multiLine true);
        
CREATE TABLE IF NOT EXISTS LAPTIMES (
		race_id INT,
		driver_id INT,
		lap INT,
		position INT,
		time VARCHAR(30),
		milliseconds INT,
		ingestion_date TIMESTAMP
		)
        USING CSV
        OPTIONS(PATH '../source/lap_times/*.csv',header true);
        
CREATE TABLE IF NOT EXISTS QUALIIFYING(
		qualify_id INT,
		race_id INT,
		driver_id INT,
		constructor_id INT,
		number INT,
		position INT,
		q1 VARCHAR(30),
		q2 VARCHAR(30),
		q3 VARCHAR(30)
		)
        USING JSON
        OPTIONS(PATH '../source/qualifying', multiLine truue);
        
	

        
            
        
			
        
