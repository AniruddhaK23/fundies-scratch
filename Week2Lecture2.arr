use context starter2024
#1
fun area(width :: Number , height :: Number)-> Number : 
  doc: " area : width , height : area=width*height"
  doc: "purpose: Takes input of height and width of an object and returns the area of the object"
  
  width * height
end

#2
# "Expression to calculate price of 4 tshirts with message 'Go Team!' written on it is 4*(5.00 + 0.10*8)"
# "Expression to calculate price of 7 tshirts with the message 'Hello World' written on it is 7*(5.00 + 0.10*11)"

fun total_cost(Number_of_shirts :: Number, print_on_shirt :: String) -> Number:
  doc: "total_cost: num of shirts , string to print on shirt : total cost of making shirt"
  doc:"purpose: function allows user to input the number of tshirts to make and string to print, then uses length of string and price per character and base price to calculate total cost"
  Number_of_shirts * (5.00 + (0.10 * string-length(print_on_shirt)))
end

#3
fun celsius_to_fahrenheit(temp :: Number) ->Number:
  doc:"celsius_to_fahrenheit : temperature in celsius : temperature in Fahrenheit"
  (temp * (9/5)) + 32
end

fun fahrenheit_to_celsius(temp :: Number) ->Number:
  doc:"fahrenheit_to_celsius : temperaute in fahrenheit : temperature in celsius"
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
  doc:"create_flag : angleOfRotation in degrees,square_side-LengthOfsquare,square_color-ColorOfSquare,circle_radius-RadiusOfCirlceDesired,circle_color-ColorOfCircle,star_side-LengthOfStarSides,star_color-ColorOfStar : Creates Desired Flag"
  diamond=rotate(angle,square(square_side,"solid",square_color))
  circle_emblem=circle(circle_radius,"solid",circle_color)
  Star=star(star_side,"solid",star_color)
  shield1=overlay(circle_emblem,diamond)
  shield2=overlay(Star,shield1)
  shield2
end
  

  