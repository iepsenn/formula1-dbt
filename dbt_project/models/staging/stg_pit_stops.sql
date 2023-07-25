select
    "raceId",
    "driverId",
    "stop",
    "lap",
    cast("time" as time) as "time",
    cast(
        case when length("duration") <= 6
            then concat('00:', "duration")
            else "duration"
        end
    as time) as "duration",
    "milliseconds"
from {{ source("staging", "pit_stops") }}