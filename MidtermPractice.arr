use context dcic2024
import lists as L
fun km_to_mile(km :: Number)->Number:
  (km / 1.6)
end

fun aqi-index(aqi :: Number)-> String:
  if aqi >= 0 block:
    if aqi <= 50:
      "Good"
    else if aqi <= 100 :
      "Moderate"
    else if aqi <= 150:
      "Unhealthy"
    else if aqi > 150:
      "Hazardous"
    end
  else:
    "Wrong Input"
  end
where:
  aqi-index(20) is "Good"
  aqi-index(-1) is "Wrong Input"
  aqi-index(200) is "Hazardous"
end

var basket = table: item :: String, price :: Number, quantity :: Number
  row: "apple", 0.50, 10
  row: "orange", 0.75, 5
  row: "watermelon", 2.99, 2
end

fun add-total(r:: Row):
  r["price"] * r["quantity"]
end

basket := build-column(basket,'total',add-total)


new_basket = filter-with(basket,lam(o): o['quantity'] > 2 end)

hello = [list: 1,2,3,4,5,6,7,8,9,10]

fun add-list(l :: List) block:
  var Sum = 0
  for each( ele from l):
    Sum:= Sum + ele
  end
  Sum
end

L.list-min(hello)