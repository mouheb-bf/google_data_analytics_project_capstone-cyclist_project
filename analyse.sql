create or replace table `circular-hawk-493309-u8.rawdata.analysed_table` as (


select
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_casual,

  
--select hour
extract (hour from started_at) as hour,

--select day
case extract(dayofweek from started_at)
when 1 then 'sunday'
when 2 then 'Monday'
when 3 then 'Tuesday'
when 4 then 'Wednesday'
when 5 then 'Thursday'
when 6 then 'Friday'
when 7 then 'Sunday'

end as day_of_week,

--select month
case extract (month from started_at) 
when 1 then 'January'
when 2 then 'february'
when 3 then 'mars'
when 4 then 'April'
when 5 then 'Mai'
when 6 then 'June'
when 7 then 'Jully'
when 8 then 'August'
when 9 then 'September'
when 10 then 'October'
when 11 then 'November'
when 12 then 'December'

end as month,

--calculate ride lengh in minutes
round(timestamp_diff(ended_at,started_at,second)/60) as ride_lenght


from `circular-hawk-493309-u8.rawdata.cleaned_table`

)
