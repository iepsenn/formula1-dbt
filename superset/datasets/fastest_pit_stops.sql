with driver_team as (
  select distinct
    driver."name" as pilot,
    circuit."name" as circuit,
    team."name" as team,
    race."year" as year
  from
    refined.fact_results result
    left join refined.dim_constructors team on team."id" = result."constructorId"
    left join refined.dim_races race on race."id" = result."raceId"
    left join refined.dim_circuits circuit on circuit."id" = race."circuitId"
    left join refined.dim_drivers driver on driver."id" = result."driverId"
),
pit_stop_time as (
  select
    driver."name" as pilot,
    circuit."name" as circuit,
    race."year" as year,
    pit_stop."duration"
  from
    refined.fact_pit_stops pit_stop
    left join refined.dim_drivers driver on driver."id" = pit_stop."driverId"
    left join refined.dim_races race on race."id" = pit_stop."raceId"
    left join refined.dim_circuits circuit on circuit."id" = race."circuitId"
)
select
  pit_stop_time."pilot",
  pit_stop_time."circuit",
  driver_team."team",
  pit_stop_time."year",
  pit_stop_time."duration"
from
  pit_stop_time
  left join driver_team USING(pilot, circuit, year)
order by
  pit_stop_time."duration" asc
limit
  10