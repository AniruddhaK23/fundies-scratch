use context dcic2024
include csv
include data-source

flights = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time ::  Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number,
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time-hour :: String
  
  source:csv-table-file("flights.csv" , default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

fun is_long_flight(row :: Row)-> Boolean :
  if row["distance"] >= 1500 :
    true
  else:
    false
  end
end

flights_new = filter-with(flights, lam(r :: Row): is_long_flight(r) end )

flights_new_ordered = order-by(flights_new,"air_time",false)

row1 = flights_new_ordered.row-n(0)
row1["carrier"]
row1["origin"]
row1["dest"]

fun is_delayed_departure(row :: Row) -> Boolean :
  if row["dep_delay"] >= 30:
    true
  else:
    false
  end
end

fun is_morning_sched_dep(row :: Row)->Boolean :
  if row["sched_dep_time"] < 1200:
    true
  else:
    false
  end
end

flights_tester = filter-with(flights , lam(o :: Row): is_delayed_departure(o) end)

flights_tester_morning = filter-with(flights_tester , lam(o :: Row): is_morning_sched_dep(o)end)

flights_tester_morning_filtered = filter-with(flights_tester_morning , lam(o :: Row): o["distance"] > 500 end)

dep_delay = order-by(flights_tester_morning_filtered,"dep_delay",false)

ROW = dep_delay.row-n(0)
ROW['flight']
ROW['origin']
ROW['dep_delay']




