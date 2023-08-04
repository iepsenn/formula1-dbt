with wins_by_team as (
  select
    constructor."name" as team,
    circuit."name" as circuit,
    count(*) as wins,
    min(number_of_races."count") as "number_of_races",
    row_number() over (partition by circuit."name" order by count(*) desc) as rank
  from refined.fact_results results 
  left join refined.dim_constructors constructor on constructor."id" = results."constructorId"
  left join refined.dim_races race on race."id" = results."raceId"
  left join refined.dim_circuits circuit on circuit."id" = race."circuitId"
  left join (select "circuitId", count(*) as "count" from refined.dim_races group by "circuitId") number_of_races on number_of_races."circuitId" = race."circuitId"
  where results."position" = 1
  group by circuit."name", constructor."name"
  order by wins desc, "team", "circuit"
)
select
  team,
  circuit,
  wins,
  number_of_races,
  round(
    cast((wins / cast(number_of_races as double precision)) * 100 as numeric), 2
  ) as win_rate
from wins_by_team
where rank = 1;


with wins_by_drivers as (
  select
    driver."name" as driver,
    circuit."name" as circuit,
    count(*) as wins,
    min(number_of_races."count") as "number_of_races",
    row_number() over (partition by circuit."name" order by count(*) desc) as rank
  from refined.fact_results results 
  left join refined.dim_drivers driver on driver."id" = results."driverId"
  left join refined.dim_races race on race."id" = results."raceId"
  left join refined.dim_circuits circuit on circuit."id" = race."circuitId"
  left join (select "circuitId", count(*) as "count" from refined.dim_races group by "circuitId") number_of_races on number_of_races."circuitId" = race."circuitId"
  where results."position" = 1
  group by circuit."name", driver."name"
  order by wins desc, "driver", "circuit"
)
select
  driver,
  circuit,
  wins,
  number_of_races,
  round(
    cast((wins / cast(number_of_races as double precision)) * 100 as numeric), 2
  ) as win_rate
from wins_by_drivers
where rank = 1;
