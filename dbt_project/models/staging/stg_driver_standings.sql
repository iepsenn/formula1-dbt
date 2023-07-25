select
    "driverStandingsId" as "id",
    "raceId",
    "driverId",
    "points",
    "position",
    "wins"
from {{ source("staging", "driver_standings") }}