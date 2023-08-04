select
  race."year",
  circuit."name" as circuit,
  team."name" as team,
  array_agg(driver."name") as pilots,
  (
    case
      when (-1 = any(array_agg(results."points")) IS NULL) then max(results."points")
      else max(results."points") - min(results."points")
    end
  ) as pilots_gap_in_points,
  (
    case
      when (-1 = any(array_agg(results."grid")) IS NULL) then max(results."grid")
      else max(results.grid) - min(results.grid)
    end
  ) as pilots_gap_grid,
  (
    case
      when (-1 = any(array_agg(results."position")) IS NULL) then max(results."position")
      else max(results.position) - min(results.position)
    end
  ) as pilots_gap_position
from
  refined.fact_results results