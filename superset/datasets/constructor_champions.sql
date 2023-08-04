with results as (
	select
		race."year",
		team."name" as team,
		max(standings."points") as points,
		row_number() over(partition by race."year" order by max(standings."points") desc) as rank
	from
		refined.fact_constructor_standings standings
		inner join refined.dim_races race on standings."raceId" = race."id"
		inner join refined.dim_constructors team on standings."constructorId" = team."id"
	group by
		race."year",
		team."name"
)
select
	year,
	to_date(year :: varchar, 'yyyy') as first_day_year,
	team,
	points
from
	results
where
	rank = 1