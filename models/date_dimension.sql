WITH CTE AS (
    Select 
    DATE(TO_TIMESTAMP (started_at)) date,
    DAYNAME(TO_TIMESTAMP (started_at)) day_of_week,
    monthname(TO_TIMESTAMP (started_at)) month,
    CASE WHEN DAYNAME(TO_TIMESTAMP (started_at)) in ('Sat','Sun') THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END TYPE_OF_DAY,
    CASE 
    WHEN monthname(TO_TIMESTAMP (started_at)) in ('Jan','Dec','Feb') THEN 'WINTER'
    WHEN monthname(TO_TIMESTAMP (started_at)) in ('Jun','Jul','Aug') THEN 'SUMMER'
    WHEN monthname(TO_TIMESTAMP (started_at)) in ('Mar','Apr','May') THEN 'SPRING'
    ELSE 'AUTUMN'
    END Season
    
    from {{ source('Project', 'BIKE') }}
    where STARTED_AT!='started_at'
) 

SELECT * FROM CTE