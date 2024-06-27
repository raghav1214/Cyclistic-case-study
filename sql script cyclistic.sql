use cyclistic;
select * from divvy_trips_2019_q1;
select count(*) from divvy_trips_2019_q1;
/*exploring data*/
select max(distinct tripduration) from divvy_trips_2019_q1;
select min(distinct tripduration) from divvy_trips_2019_q1;
select min(distinct usertype) from divvy_trips_2019_q1;
select max(distinct usertype) from divvy_trips_2019_q1;
select avg(tripduration) as avg_trip from divvy_trips_2019_q1;
select bikeid,from_station_id,to_station_id from divvy_trips_2019_q1;
select trip_id,bikeid,from_station_name,to_station_name,usertype from divvy_trips_2019_q1;
/*adding a new table divvy_trips_2020_q1*/
select * from divvy_trips_2020_q1;
select count(*) from divvy_trips_2020_q1;
select ride_id,start_lat,start_lng,end_lat,end_lng from divvy_trips_2020_q1;
select min(distinct member_casual) from divvy_trips_2020_q1;
select max(distinct member_casual) from divvy_trips_2020_q1;
/*using join functions*/
select rideable_type,start_station_id,end_station_id
from divvy_trips_2020_q1 as d1
inner join divvy_trips_2019_q1 as d2
on d1.ride_id = d2.bikeid;
select d1.ride_id,d2.bikeid,d1.start_station_name,d1.end_station_name,d1.member_casual
from divvy_trips_2019_q1 as d2
inner join divvy_trips_2020_q1 as d1
on d1.start_station_name = d2.from_station_name;
/*summary statistics*/
select max(tripduration) as max_trip, min(tripduration) as min_trip from divvy_trips_2019_q1;
select trip_id,gender,birthyear,from_station_name,to_station_name 
from divvy_trips_2019_q1
where birthyear between 1980 and 1990
order by birthyear asc;
select count(gender) from divvy_trips_2019_q1 where gender="Male";
select count(gender) from divvy_trips_2019_q1 where gender="Female";
select avg(tripduration) from divvy_trips_2019_q1 where birthyear=1983;
select avg(tripduration) from divvy_trips_2019_q1 where birthyear=1987 and gender="Male";
select 
	case when birthyear < 1950 then "under 1950"
    when birthyear between 1950 and 1960 then "1950-1960"
    when birthyear between 1961 and 1970 then "1961-1970"
    when birthyear between 1971 and 1980 then "1971-1980"
    when birthyear between 1981 and 1990 then "1981-1990"
    when birthyear between 1991 and 1995 then "1991-1995"
    else "Over 1995"
end as age_group,
avg(tripduration) as avg_trip
from divvy_trips_2019_q1
group by age_group
order by age_group asc;
