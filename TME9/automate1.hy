var 
    x: clock;
    y: clock;
   
    
automaton automate1
    synclabs:a,
             b,
             c,
             d;
    initially q0 & x=0 & y = 0;

loc q0:
    while x<3 & y<=1    wait {}
    when y>0 & y<=1 do {y'=0} sync a goto q0;
    when x>2 & x<3 do {} sync b goto q1; 

loc q1: 
    while True wait {}
    when y>1 & x>3 & x<4 do {} sync c goto q2;
    when x-y<1 & x>2 & x<3 do {} sync d goto q3;
loc q2:
    while True wait {}
    
loc q3:
    while True wait {}
end 

var init, accessible, but: region;
init:= loc [automate1] = q0 & x=0 & y=0;
but:= loc [automate1] = q2;
accessible:= reach forward from init endreach;
prints "Automate1:";
print init;
print but;
print trace to but using accessible;
print accessible;
    

