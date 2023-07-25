select
    "constructorStandingsId" as "id",
    "raceId",
    "constructorId",
    "points",
    "position",
    "wins"
from {{ source("staging", "constructor_standings") }}
