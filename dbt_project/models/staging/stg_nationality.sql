with
nationalities as (
	select distinct nationality
	from {{ ref("stg_constructors") }}
	union all
	select distinct nationality
	from {{ ref("stg_drivers") }}
),
final as (
	select distinct nationality as nationality from nationalities
)
select
	row_number() over () as id,
	final.nationality
from final
order by final.nationality