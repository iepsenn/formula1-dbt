select
    "raceId" as "id",
	"year",
	"round",
	"circuitId",
	"name",
	cast("date" as date) as "date",
    cast(NULLIF("time", '\N') as time) as "time"
from {{ source("staging", "races") }}