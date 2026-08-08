{%macro get_season(x)%}
CASE 
    WHEN monthname(TO_TIMESTAMP ({{x}})) in ('Jan','Dec','Feb') THEN 'WINTER'
    WHEN monthname(TO_TIMESTAMP ({{x}})) in ('Jun','Jul','Aug') THEN 'SUMMER'
    WHEN monthname(TO_TIMESTAMP ({{x}})) in ('Mar','Apr','May') THEN 'SPRING'
    ELSE 'AUTUMN'
    END

{%endmacro%}

{%macro day_type(x)%}
 CASE WHEN DAYNAME(TO_TIMESTAMP ({{x}})) in ('Sat','Sun') THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END
{%endmacro%}