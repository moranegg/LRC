/*Base*/

subs(chat,felin).
subs(lion,felin).

subs(chien,canide).
subs(canide,chien).

subs(souris,mammifere).
subs(felin,mammifere).
subs(canide,mammifere).

subs(mammifere,animal).
subs(canari,animal).

subs(animal,etreVivant).

subs(and(animal,plante),nothing).
subs(and(animal, some(aMaitre)),pet).
subs(pet, some(aMaitre)).
subs(some(aMaitre), all(aMaitre,humain)).
subs(chihuahua,and(chien,pet)).


not_member(_,[]).
not_member(E,[T|Q]):-E\==T,not_member(E,Q).


/*Operateurs*/
subS1(C,C).
subS1(C,D):-subs(C,D).
subS1(C,D):-subs(C,Z),Z\==D,subS1(Z,D).
/**/
subsS(C,C,L):-not_member(C,L). 
subsS(C,D,_):-subs(C,D). 
subsS(C,D,L):-subs(C,Z),Z\==D,not_member(Z,L),subsS(Z,D,[Z|L]).
subsS(C,D):-subsS(C,D,[]).

/*Intersection*/
subsS(C,and(B,D)):-subsS(C,B), subsS(C,D). 

subsS(and(B,D),C):-subsS(B,C), subsS(D,C). 

%Redondant : subsS(and(B,D),and(E,F)):-subsS(B,E), subsS(B,F),subsS(D,E), subsS(D,F). 
/*Quantification existentielle
some(R).*/

/**/


