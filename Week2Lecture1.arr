use context starter2024
#1
TriSideLen=35
TriColor="orange"
orange-triangle=triangle(TriSideLen,"solid",TriColor)
orange-triangle

#2
Sq_side=35
Sq_color="orange"
Square_1=square(Sq_side,"solid",Sq_color)
Square_1

#3
Square_2=square(35,"solid","red")
Square_2

#4
#Sq_side=40
#Square=square(Sq_side,"solid","red")

#5
rect_length=120
rect_width=60
radius=20
circle_yellow1=circle(radius,"solid","yellow")
rectangle_black=rectangle(rect_length,rect_width,"solid","black")
result=overlay(circle_yellow1,rectangle_black)
result
circle_yellow2=circle(radius,"solid","yellow")
double_circle=beside(circle_yellow1,circle_yellow2)
double_circle
double_circle_on_rectangle=overlay-xy(double_circle,-20,-10,rectangle_black)
double_circle_on_rectangle


flag_background=rectangle(300,200,"solid","blue")
stripe=rectangle(300,40,"solid","white")
sun=circle(40,"solid","yellow")
flag_=overlay-xy(stripe,-150,-100,flag_background)
flag_final=overlay-xy(sun,-150,-100,flag_)
flag_final
