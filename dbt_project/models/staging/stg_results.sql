select
	"resultId" as "id",
	"raceId",
	"driverId",
	"constructorId",
	cast(NULLIF("number", '\N') as int) as "number",
	"grid",
	cast(NULLIF("position", '\N') as int) as "position",
	"positionOrder",
	"points",
	"laps",
	cast(NULLIF("fastestLap", '\N') as int) as "fastestLap",
	cast(NULLIF("rank", '\N') as int) as "rank",
	cast(NULLIF("fastestLapTime", '\N') as time) as "fastestLapTime",
	cast(NULLIF("fastestLapSpeed", '\N') as double precision) as "fastestLapSpeed",
	"statusId"
from {{ source("staging", "results") }}



