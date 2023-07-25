select
	"resultId" as "id",
	"raceId",
	"driverId",
	"constructorId",
	"number",
	"grid",
	cast(NULLIF("position", '\N') as int) as "position",
	"positionOrder",
	"points",
	"laps",
	cast(NULLIF("fastestLap", '\N') as int) as "fastestLap",
	cast(NULLIF("fastestLapTime", '\N') as time) as "fastestLapTime",	
	"statusId"
from {{ source("staging", "sprint_results") }}
