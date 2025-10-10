use context dcic2024
import math as M
import statistics as S

cafe-data =
  table: day, drinks-sold
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end
cafe-data.get-column("drinks-sold")

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-discount-codes = distinct(discount-codes)
upper-codes = map(string-to-upper,unique-discount-codes)

survey-responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]
distinct-survey = distinct(survey-responses)
lower-distinct-survey = map(string-to-lower,distinct-survey)

fun delmaybe(response :: String)->Boolean:
  not(response == "maybe")
end

binary-response = filter(delmaybe , lower-distinct-survey)

binary-response-lambda = filter(lam(o)->Boolean : not( o == "maybe")end , lower-distinct-survey)

fun product( L :: List)-> Number block:
  var total = 1
  for each(num from L):
    total:= total * num
  end
  total
end

list1 = [list: 1,2,3,4,5]
p1 = product(list1)
list2 = [list: 0,1,2,3,4,5]
p2 = product(list2)

fun sum-even( L :: List)->Number block:
  var total-even = 0
  for each(num from L):
    if num-modulo(num,2) == 0 :
      total-even := total-even + num
    else:
      total-even := total-even + 0
    end
  end
  total-even
end

p3 = sum-even(list1)

fun my-length( L :: List)->Number block:
  var num-ele = 0
  for each(num from L):
    num-ele:= num-ele + 1
  end
  if num-ele == 0:
    0
  else:
    num-ele
  end
end

p4 = my-length(list1)
p5 = my-length([list:])

fun double-list( L :: List)->List block:
  var new-list = [list:]
  for each(num from L):
    new-list:= new-list.append( [list: num * 2])
  end
  new-list
end

p6 = double-list(list1)
p7 = double-list(list2)
p8 = double-list([list:])

fun doubles-map(L :: List)->List block:
  map(lam(o): o * 2 end , L)
end
p9 = doubles-map(list1)

fun my-string-lens(L :: List)-> List block:
  var new-list = [list:]
  for each(str from L):
    new-list:= new-list.append( [list: string-length(str)])
  end
  new-list
end

fun my-string-lens-lambda(L :: List)->List block:
  map(lam(o): string-length(o) end, L)
end
p10 = my-string-lens([list: "hi",'hello','i','ani'])
p11 = my-string-lens-lambda([list: "hi",'hello','i','ani'])

fun my-alternating(L :: List)->List block:
  var alt-list = [list:]
  var counter = 0
  for each(ele from L) block:
    if num-modulo(counter,2) == 0 block:
      alt-list:= alt-list.append([list: ele])
      counter:= counter + 1
    else: 
      counter:= counter + 1
    end
  end
  alt-list
end
      
p12 = my-alternating(list1)
p13 = my-alternating([list: "hi",'hello','i','ani'])