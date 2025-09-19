use context starter2024
#1
fun area(width :: Number , height :: Number)-> Number : 
  doc: "Calculates the area using height and width"
  width * height
end

#2
# "Expression to calculate price of 4 tshirts with message 'Go Team!' written on it is 4*(5.00 + 0.10*8)"
# "Expression to calculate price of 7 tshirts with the message 'Hello World' written on it is 7*(5.00 + 0.10*11)"

fun total_cost(Number_of_shirts :: Number, print_on_shirt :: String) -> Number:
  Number_of_shirts * (5.00 + (0.10 * string-length(print_on_shirt)))
end

#3
fun celsius_to_fahrenheit(temp :: Number) ->Number:
  (temp * (9/5)) + 32
end

fun fahrenheit_to_celsius(temp :: Number) ->Number:
  (temp - 32) * (5/9)
end

check:
  celsius_to_fahrenheit(0) is 32
  celsius_to_fahrenheit(10) is 50
  fahrenheit_to_celsius(32) is 0
  fahrenheit_to_celsius(50) is 10
end

#4
fun create_flag(angle :: Number,square_side :: Number , square_color :: String , circle_radius :: Number , circle_color :: String , star_side :: Number , star_color :: String ) :
  diamond=rotate(angle,square(square_side,"solid",square_color))
  circle_emblem=circle(circle_radius,"solid",circle_color)
  Star=star(star_side,"solid",star_color)
  shield1=overlay(circle_emblem,diamond)
  shield2=overlay(Star,shield1)
  shield2
end
  

  