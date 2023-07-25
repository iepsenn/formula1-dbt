select
    "raceId",
    "driverId",
    "lap",
    "position",
    cast("time" as time) as "time",
    "milliseconds"
from {{ source("staging", "lap_times") }}