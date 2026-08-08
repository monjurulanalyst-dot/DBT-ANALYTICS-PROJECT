WITH CTE AS (
    Select 
    DATE(TO_TIMESTAMP (started_at)) date,
    DAYNAME(TO_TIMESTAMP (started_at)) day_of_week,
    monthname(TO_TIMESTAMP (started_at)) month,
   {{day_type('started_at')}} TYPE_OF_DAY,
    {{get_season('started_at')}} Season
    
    from {{ source('Project', 'BIKE') }}
    where STARTED_AT!='started_at'
) 

SELECT * FROM CTE