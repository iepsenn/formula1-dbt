select
    "circuitId" as "id",
    "circuitRef",
    "name",
    "location",
    "country"
from {{ source("staging", "circuits") }}
