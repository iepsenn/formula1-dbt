select
	"statusId" as "id",
	"status"
from {{ source("staging", "status") }}



