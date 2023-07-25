select
    "driverId" as "id",
    "driverRef",
    cast(NULLIF("number", '\N') as int) as "number",
    NULLIF("code", '\N') as "code",
    concat("forename", ' ', "surname") as "name",
    "dob" as "birthday",
    "nationality"
from {{ source("staging", "drivers") }}