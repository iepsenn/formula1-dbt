select
    driver."id" as "id",
    "driverRef",
    "number",
    "code",
    "name",
    "birthday",
    nationality."id" as "nationalityId"
from {{ ref("stg_drivers") }} driver
inner join {{ ref("stg_nationality") }} nationality
on driver.nationality = nationality.nationality
