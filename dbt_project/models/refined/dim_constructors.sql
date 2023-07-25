select
    constructor."id" as "id",
    "constructorRef",
    "name",
    nationality."id" as "nationalityId"
from {{ ref("stg_constructors") }} constructor
inner join {{ ref("stg_nationality") }} nationality
on constructor.nationality = nationality.nationality
