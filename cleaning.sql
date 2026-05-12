--creating a table with non null values
create table if not exists `circular-hawk-493309-u8.rawdata.cleaned_table` as (
select *,

from `circular-hawk-493309-u8.rawdata.data_combined`

where (
start_station_id is not null
AND
start_station_name is not null
AND
end_station_id is not null
AND
end_station_name is not null
AND
end_lat is not null
AND
end_lng is not null
and
--eliminating outliers (rides>24hours and <1mn)
timestamp_diff(ended_at,started_at,second) > 60
and
timestamp_diff(ended_at,started_at,second) <86400
))