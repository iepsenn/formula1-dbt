select
    "qualifyId" as "id",
    "raceId",
    "driverId",
    "constructorId",
    "number",
    "position",
    cast(case when "q1" = '\N' then NULL else "q1" end as time) as "q1",
    cast(case when "q2" = '\N' then NULL else "q2" end as time) as "q2",
    cast(case when "q3" = '\N' then NULL else "q3" end as time) as "q3"
from {{ source("staging", "qualifying") }}