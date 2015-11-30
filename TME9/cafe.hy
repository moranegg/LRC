var 
    x: clock;
    solde:analog;
    
   
    
automaton cafe
    synclabs:insert,
             rendu,
             rembourse,
             demande,
             prepare;
    initially q0 & x=0 & solde=0;

loc q0:
    while True  wait {dsolde= 1}
    when True do {x'=0} sync insert goto q1;


loc q1: 
    while x<10 & solde<5 wait {dsolde=1}
    when x=10 do{} sync rendu goto q0;
    when x<10 do{} sync rembourse goto q0;
    when solde>5 do{} sync demande goto q2;
    
loc q2:
    while x<30 wait {dsolde=0}
    when x<30 do{} sync prepare goto q0;
end 

var init, accessible, but: region;
init:= loc [cafe] = q0 & x=0 & solde=0;
but:= loc [cafe] = q2;
accessible:= reach forward from init endreach;
prints "cafe:";
print init;
print but;
print trace to but using accessible;
print accessible;
    

