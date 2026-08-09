WITH TRIPS AS(
    SELECT ride_id,rideable_type,
    DATE(to_timestamp(started_at))TRIP_DATE,start_statio_id as start_station_id,
    end_station_id,member_csual as member_casual,
    TIMESTAMPDIFF(second,to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration 
    FROM {{ source('Project', 'BIKE') }}
    WHERE RIDE_ID!='ride_id'
)
select*from TRIPS