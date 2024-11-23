use  xyz;
show tables;

select race_id,circuiit_id,race_year,name as race_name,race_timestamp as race_date from races where race_year=2020 and name ='Abu Dhabi Grand Prix';
select circuit_id,location as circuit_locatiioin from circuits;
select driver_id,name as driver_name, number as driver_number, nationality as driver_nationality from drivers;
select constructor_id,name as team from constructor;
select race_id,result_id,driver_id,constructor_id,grid,fastest_lap,time as race_time,points from results;

select race_year,race_name,race_date,circuit_location,driver_name,driver_number,driver_nationality,team,grid,fastest_lap,race_time,points,current_date() as ingested_date from
(select circuit_id,location as circuit_location from circuits) a 
join (select race_id,circuiit_id,race_year,name as race_name,race_timestamp as race_date from races where race_year=2020 and name ='Abu Dhabi Grand Prix') b on a.circuit_id = b.circuiit_id
join (select race_id,result_id,driver_id,constructor_id,fastest_lap,grid, time as race_time,points from results) c on b.race_id= c.race_id
join (select driver_id,name as driver_name, number as driver_number, nationality as driver_nationality from drivers) d on d.driver_id = c.driver_id
join (select constructor_id,name as team from constructor) e on e.constructor_id = c.constructor_id
order by points desc;


INSERT INTO race_results_agg 
select race_year,race_name,race_date,circuit_location,driver_name,driver_number,driver_nationality,team,grid,fastest_lap,race_time,points,current_date() as ingested_date from
(select circuit_id,location as circuit_location from circuits) a 
join (select race_id,circuiit_id,race_year,name as race_name,race_timestamp as race_date from races where race_year in ('2019','2020')) b on a.circuit_id = b.circuiit_id
join (select race_id,result_id,driver_id,constructor_id,fastest_lap,grid, time as race_time,points from results) c on b.race_id= c.race_id
join (select driver_id,name as driver_name, number as driver_number, nationality as driver_nationality from drivers) d on d.driver_id = c.driver_id
join (select constructor_id,name as team from constructor) e on e.constructor_id = c.constructor_id
order by points desc;

INSERT INTO race_results_driver_standing
select race_year,race_name,race_date,circuit_location,driver_name,driver_number,driver_nationality,team,grid,fastest_lap,race_time,points,position,current_date() as ingested_date from
(select circuit_id,location as circuit_location from circuits) a 
join (select race_id,circuiit_id,race_year,name as race_name,race_timestamp as race_date from races where race_year in ('2019','2020')) b on a.circuit_id = b.circuiit_id
join (select race_id,result_id,driver_id,constructor_id,fastest_lap,grid,position, time as race_time,points from results) c on b.race_id= c.race_id
join (select driver_id,name as driver_name, number as driver_number, nationality as driver_nationality from drivers) d on d.driver_id = c.driver_id
join (select constructor_id,name as team from constructor) e on e.constructor_id = c.constructor_id
order by points desc;


select count(*) from race_results_agg ;
select count(distinct race_name) from race_results_agg;
select sum(points), count(distinct(race_name))  from race_results_agg where driver_name = "Lewis Hamilton";
select driver_name, sum(points) as pnts from race_results_agg group by driver_name;

select race_year,driver_name,sum(points)as total_points,count(distinct(race_name))as number_races from race_results_agg
group by race_year,driver_name
order by race_year,driver_name;

select race_year,driver_name,driver_nationality,team,pnts,rank() OVER (partition by race_year order by pnts desc) as ranks from 
(select race_year,driver_name,driver_nationality,team, sum(points) as pnts from race_results_agg 
group by race_year,driver_name,driver_nationality,team) a ;


select race_year,driver_name,driver_nationality,team,pnts,rank() OVER (partition by race_year order by pnts desc,) as ranks from 
(select race_year,driver_name,driver_nationality,team, sum(points) as pnts from race_results_agg 
group by race_year,driver_name,driver_nationality,team) a ;

select * from race_results_driver_standing;

select race_year,driver_name,driver_nationality,team,pnts,win,dense_rank() OVER(partition by race_year order by pnts desc,win desc) as ranks from
(select race_year,driver_name,driver_nationality,team,sum(position) as win, sum(points) as pnts from race_results_driver_standing
group by race_year,driver_name,driver_nationality,team) a