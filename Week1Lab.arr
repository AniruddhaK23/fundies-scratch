use context starter2024
#1
setup_fee=3
tshirt_fee=12
cost=(tshirt_fee * 5) + setup_fee
cost
new_cost=(tshirt_fee * 7) + setup_fee
new_cost

width=420
height=549
perimeter= 2 * (width + height)
poster_cost= perimeter * 0.10
poster_cost

#2
Tagline="Designs for Everyone!"
#faulty_tagline="Designs for Everyone! 
Tagline
addition="Red" + "Blue"
addition
#you cant add numbers and strings together even though you can add numbers together and strings together

#3
Frame=rectangle(40,100,"solid","black")
red_circle=circle(10,"solid","red")
yellow_circle=circle(10,"solid","yellow")
green_circle=circle(10,"solid","green")
lights=above(red_circle,above(yellow_circle,green_circle))
traffic_light=overlay-xy(lights,-9,-15,Frame)
pole=rectangle(10,50,"solid","black")
traffic_light_withpole=above(traffic_light,pole)
traffic_light_withpole

#4
rectangle(50,20,"solid","black") #1
circle(30,"solid","red") #2

#5
background=rectangle(150,100,"solid","blue")
stripe=rectangle(150,20,"solid","white")
emblem=circle(20,"solid","red")
flag1=overlay-xy(stripe,0,-20,background)
flag2=overlay(emblem,flag1)
flag2

diamond=rotate(45,square(100,"solid","gray"))
circle_emblem=circle(30,"solid","red")
Star=star(20,"solid","yellow")
shield1=overlay(circle_emblem,diamond)
shield2=overlay(Star,shield1)
shield2
