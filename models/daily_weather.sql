WITH Daily_weather AS(
    Select DATE(TIME) as date,weather,
    clouds,humidity,temp,pressure
    from {{ source('Project', 'WEATHER') }}
    
),
Daily_weather_agg AS(
    Select date,weather,
     round(avg(clouds),2) avg_clouds,
     round(avg(humidity),2) avg_humidity,
     round(avg(temp),2) avg_temp,
     round(avg(pressure),2) avg_pressure from Daily_weather
    group by date,weather
    Qualify ROW_NUMBER() OVER (PARTITION BY date ORDER BY count(weather)desc)=1
)
Select*from Daily_weather_agg

