use context dcic2024
include csv
include data-source
#Function tells you whether a given year is a leap year or not
fun leap-year(year :: Number) ->Boolean :
  if num-modulo(year,4) == 0:
    true
  else:
    false
  end
end

#Function behaves like a clock
fun tick(Second :: Number) :
  if (Second >= 0) and (Second < 59):
    Second + 1
    #checks for invalid time stamp
  else if Second < 0 :
    "Invalid time-stamp"
  else if Second == 59 :
    "1 minute"
  end
where:
  tick(24) is 25
  tick(-1) is "Invalid time-stamp"
  tick(59) is "1 minute"
end

fun rock-paper-scissors(p1 :: String , p2 :: String)-> String :
  
  if p1 == "rock" :
    if p2 == "rock":
      "Tie Game"
    else if p2 == "scissors" :
      "Player 1 wins!"
    else if p2 == "paper" :
      "Player 2 wins!"
    else:
      "Player 2 has invalid input"
    end
  else if p1 == "scissors":
    if p2 == "rock":
        "Player 2 wins!"
    else if p2 == "paper":
        "Player 1 wins!"
    else if p2 == "scissors":
      "Tie Game"
    else:
      "Player 2 has invalid input"
    end
  else if p1 == "paper":
    if p2 == "rock":
      "Player 1 wins!"
    else if p2 == "paper":
      "Tie Game"
    else if p2 == "scissors":
      "Player 2 wins!"
    else:
      "Player 2 has invalid input"
    end
  else:
    "Player 1 has invalid input"
  end
where:
  rock-paper-scissors("rock","paper") is "Player 2 wins!"
  rock-paper-scissors("rock","rock") is "Tie Game"
  rock-paper-scissors("hello","rock") is "Player 1 has invalid input"
  rock-paper-scissors("paper","a game") is "Player 2 has invalid input"
end

planets =table:planet :: String, Distance :: Number
  row: "Mercury", 0.39
  row: "Venus" , 0.72
  row: "Earth" , 1
  row: "Mars" , 1.52
  row: "Jupiter" , 5.2
  row: "Saturn",9.54
  row: "Uranus",19.2
    row: "Neptune",30.06
end
mars=planets.row-n(4)
distance=mars["Distance"]


something = load-table:
  year :: Number,
  day :: Number,
  month :: String,
  rate :: Number
  source: csv-table-file("boe_rates.csv",default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
end
something.length()
rate_median= median(something,"rate")
rate_mode= modes(something,"rate")
sorted_highest_first= order-by(something,"rate",false)
sorted_lowest_first= order-by(something,"rate",true)
    
