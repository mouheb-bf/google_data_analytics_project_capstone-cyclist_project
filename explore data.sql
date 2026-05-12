--checking for NULL values in our combined table

select 
countif(ride_id is NULL) as ride_id_null,
countif(rideable_type is NULL) as rideable_null,
countif(started_at is NULL) as start_null,
countif (ended_at is NULL) as end_null,
countif (start_station_name is NULL) as start_station_null,
countif (start_station_id is NULL) as start_station_id_null,
countif (end_station_name is NULL) as end_station_null,
countif (end_station_id is NULL) as end_station_id_null,
countif (start_lat is NULL) as start_lat_null,
countif (start_lng is NULL) as start_lng_null,
countif (end_lat is NULL) as end_lat_null,
countif (end_lng is NULL) as end_lng_null,
countif (member_casual is NULL) as member_casual_null

from `circular-hawk-493309-u8.rawdata.data_combined`;


--checking if there is mispealing rideable_type 

select
rideable_type, count(rideable_type) as num_rideable_type

from `circular-hawk-493309-u8.rawdata.data_combined`

group by
rideable_type; 



--checking if there is mispealing member_casual (we should have only two categories)

select
member_casual,
count (member_casual)

from `circular-hawk-493309-u8.rawdata.data_combined`  as num_member_casual

group by member_casual; 


--checking for duplicates row (we shouln't  have duplicates in our primary key)

select
count (*) - count(distinct ride_id) as duplicate_ride_id

from `circular-hawk-493309-u8.rawdata.data_combined`;


--checking for outliers (rides >1 day)

select count(*) as outliers_24h

from `circular-hawk-493309-u8.rawdata.data_combined`

where
(
(
((extract(hour FROM ended_at)-extract(hour from started_at))*60)+
((extract(minute FROM ended_at)-extract(minute from started_at)))+
((extract(second FROM ended_at)-extract(second from started_at))/60)
)>1660
);


--checking for outliers (rides <1 min)

select count(*) as outliers_1mn

from `circular-hawk-493309-u8.rawdata.data_combined`

where
(
(
((extract(hour FROM ended_at)-extract(hour from started_at))*60)+
((extract(minute FROM ended_at)-extract(minute from started_at)))+
((extract(second FROM ended_at)-extract(second from started_at))/60)
)<1
)






