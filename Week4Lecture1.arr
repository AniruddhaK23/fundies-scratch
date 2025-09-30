use context dcic2024
include csv
include data-source

orders= table: time :: String , amount :: Number 
  row: "08:00",10.50
  row: "09:30", 5.75
  row: "10:15" , 8.00
  row: "11:00", 3.95
  row: "14:00",4.95
  row: "16:45" , 7.95
end

#1
fun is-morning(row :: Number)-> Boolean :
  if row <= orders.length() :
    if orders.row-n(row) < "12:00" :
      true
    else:
      false
    end
  else:
    false
  end
end

morning-orders = orders.filter(lam(o) : o["time"] < "12:00" end)

orders-reversed = orders.order-by("time",false)

morning-orders-2 = orders.order-by("time",false)
Row = morning-orders-2.row-n(0)["amount"]

places = load-table:
  Location :: String,
  Subject :: String,
  Date :: Date
  source: csv-table-url("https://pdi.run/f25-2000-photos.csv",default-options)
end

forest-table = places.filter(lam(o): o["Subject"] == "Forest" end)

forest-table-ordered = forest-table.order-by("Date",true)
location = (forest-table-ordered.row-n(0))["Location"]

photos = count(places,"Location")
photos-ordered = photos.order-by("count", false )

freq-bar-chart(places,"Location")

