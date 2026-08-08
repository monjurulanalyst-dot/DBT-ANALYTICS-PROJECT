select *
from {{ source('Project', 'BIKE') }}
LIMIT 10