use context dcic2024
include data-source 
include csv
  var flights_53 = load-table:
   rownames :: Number,
   dep_time :: Number,
   sched_dep_time :: Number,
   dep_delay :: Number,
   arr_time :: Number,
   sched_arr_time :: Number,
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
   time_hour :: Date
  source: csv-table-file("flights_sample53.csv",default-options)
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

fun replace_empty( o :: String ):
  if o == '':
      "UNKNOWN"
  else:
    o
    end
  end

flights_53 := transform-column(flights_53,'tailnum',replace_empty)

fun replace_negative(o :: Number):
  if o < 0:
    0
  else:
    o
  end
end

flights_53:=transform-column(flights_53,'dep_delay',replace_negative)
flights_53:=transform-column(flights_53,'arr_delay',replace_negative)

flights_53:=transform-column(flights_53,'flight',lam(o): num-to-string(o) end)

fun trim(s :: String)->String:
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s," ","")
  end
end

flights_53:=transform-column(flights_53,'carrier',trim)

fun normalise_dep_time( o :: Number)->String block:
  
  var time = ""
  var minute = 0
  var hour = num-floor(o / 100)
  minute:=num-modulo(o,100)
  minute:=num-to-string(minute)
  hour:=num-to-string(hour)
  time:= hour + ":" + minute
  time
end

flights_53:=transform-column(flights_53,'dep_time',normalise_dep_time)

flights_53:=build-column(flights_53,"dedup_key",lam(o): o['flight'] + '-' + o['carrier'] + '-' + o['dep_time'] end)    

grouped = group(flights_53,'dedup_key')
duplicates = grouped.build-column("count",lam(o): o['subtable'].length() end)

scatter-plot(flights_53,'air_time','distance')

d = flights_53.column('distance')

fun summarize( L :: List)block:
  var total_dist = 0
  var max_dist = 0
  var avg_dist = 0
  for each( ele from L) block:
    total_dist:= total_dist + ele
    if ele >= max_dist:
      max_dist:= ele 
    else:
      max_dist:= max_dist
    end
end
  avg_dist:= total_dist / length(d)
  print(total_dist)
  print(max_dist)
  print(avg_dist)
end


summarize(d)



