select
    "constructorId" as "id",
    "constructorRef",
    "name",
    "nationality"
from {{ source("staging", "constructors") }}