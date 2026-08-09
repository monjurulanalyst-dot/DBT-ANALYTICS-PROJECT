WITH BIKE AS (
    select distinct START_STATIO_ID as station_id,START_STATION_NAME,
    round(START_LAT,2) as START_LAT,round(START_LNG,2) as START_LNG
from {{ source('Project', 'BIKE') }}
WHERE RIDE_ID !='ride_id'
)
select * from BIKE