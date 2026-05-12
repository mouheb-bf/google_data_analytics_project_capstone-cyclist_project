create table if not exists  `circular-hawk-493309-u8.rawdata.data_combined` as (

select *
from `circular-hawk-493309-u8.rawdata.202603`

union all

select *
from `circular-hawk-493309-u8.rawdata.202602`

union all

select *
from `circular-hawk-493309-u8.rawdata.202601`

union all

select *
from `circular-hawk-493309-u8.rawdata.202512`

union all

select *
from `circular-hawk-493309-u8.rawdata.202511`

union all

select *
from `circular-hawk-493309-u8.rawdata.202510`

union all

select *
from `circular-hawk-493309-u8.rawdata.202509`

union all

select *
from `circular-hawk-493309-u8.rawdata.202508`

union all

select *
from `circular-hawk-493309-u8.rawdata.202507`

union all

select *
from `circular-hawk-493309-u8.rawdata.202506`

union all

select *
from `circular-hawk-493309-u8.rawdata.202505`

union all

select *
from `circular-hawk-493309-u8.rawdata.202504`

);

select count (*) as total_rows
from `circular-hawk-493309-u8.rawdata.data_combined`

