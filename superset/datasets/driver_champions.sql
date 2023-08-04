with points_by_year as (
    select
        race."year" as season,
        driver."name" as driver,
        sum(standings."points") as points,
        row_number() over(partition by race."year" order by sum(standings."points") desc) as rank
    from
        refined.fact_driver_standings standings
        inner join refined.dim_races race on standings."raceId" = race."id"
        inner join refined.dim_drivers driver on standings."driverId" = driver."id"
    group by
        driver."name",
        race."year"
)
select
    season,
    driver,
    points
from
    points_by_year
where
    rank = 1