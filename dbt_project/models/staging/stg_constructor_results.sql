select
    "constructorResultsId" as "id",
    "raceId",
    "constructorId",
    "points"
from {{ source("staging", "constructor_results") }}
