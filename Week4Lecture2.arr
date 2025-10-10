use context dcic2024
include data-source
items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

fun pull-closer(n :: Number) -> Number:
  n * 0.90

end

moved_items = transform-column(transform-column(items,"x-coordinate",pull-closer),"y-coordinate",pull-closer)

fun calc-distance(r :: Row) -> Number:
  num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"])
end
items-with-distance = build-column(items,"distance",calc-distance)

items-with-distance-ordered = order-by(items-with-distance , "distance" , true)

closest_item = (items-with-distance-ordered.row-n(0))["item"]

fun obfuscate(r :: String)-> String: 
  string-repeat("X", string-length(r))
end

obfuscated-items = transform-column(items , "item", obfuscate)




