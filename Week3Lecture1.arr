use context starter2024
fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat,if less than 10 then a winter hat else nothing"
  if temp-in-C >= 27:
    "sun hat"
  else if temp-in-C < 10:
    "winter hat"
  else:
    "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(27) is "sun hat"
  choose-hat(5) is "winter hat"
end
#2
fun choose-hat-ask(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat,if less than 10 then a winter hat else nothing"
  ask:
    |temp-in-C >= 27 then: "sun hat"
    |(temp-in-C < 27) and (temp-in-C < 10) then: "winter hat"
    |otherwise: "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(27) is "sun hat"
  choose-hat(5) is "winter hat"
end

#3
fun add-glasses(outfit :: String)->String:
  if string-length(outfit) > 0:
    outfit + " and glasses"
  else:
    "no outfit entered"
  end
where:
  add-glasses("tshirt") is "tshirt and glasses"
  add-glasses("") is "no outfit entered"
end


#4
fun choose-outfit(temp-in-C :: Number,outfit :: String)->String:
  final_outfit=' '
  p1=choose-hat(temp-in-C)
  p2=add-glasses(outfit)
  final_outfit + p1 + p2
  
end

#5
fun choose-hat-or-visor(temp-in-C :: Number , has-visor :: Boolean )-> Boolean:
  if (has-visor == true) and (temp-in-C > 30) :
    true
  else: 
    false
  end
end

#6
fun display-grade(marks :: Number)->String :
  if marks >= 70:
    'A'
  else if marks >= 60:
    'B'
  else if marks >= 50:
    'C'
  else:
    'F'
  end
end