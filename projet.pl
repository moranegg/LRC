/*Commentaire !*/

/*
*Projet-Subsomption structurelle
*Un algorithme de subsomption structurelle pour la logique
*de description FL-.
* Auteurs: Arthur Ramolet et Morane Gruenpeter
*/

/*Base (exercice 1)*/
/*T-Box*/
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
/*A-box*/
/*******************************************************************************/
/*trouver si un element E n'est pas memebre d'une liste L*/
not_member(_,[]).
not_member(E,[T|Q]):-E\==T,not_member(E,Q).

/*******************************************************************************/
/*Operateurs*/
/*Subsomption en exercice 2.1
*ne permet pas de ____________________
*/
/*solution trivial*/
subS1(C,C). 
/**/
subS1(C,D):-subs(C,D).
/*Par transitivite*/
subS1(C,D):-subs(C,Z),Z\==D,subS1(Z,D).
/*****************************************************************************/
/*Subsomption en exercice 2.4
* en utilisant la fonction not_member, teste la condition que Z ne soit pas dans L
*/
subsS(C,C,_). 
subsS(C,D,_):-subs(C,D). 

subsS(C,and(E,F),L):-subs(C,Y),subs(C,Z),Y\==E,Z\==F,not_member(Y,L),not_member(Z,L),subsS(Y,E,[Y|L]),subsS(Z,F,[Z|L]).

subsS(C,D,L):-subs(C,Z),Z\==D,not_member(Z,L),subsS(Z,D,[Z|L]).
 
/*******************************************************************************/
/*Intersection en exercice 3
*
*/
%subsS(C,and(E,F)):-subsS(C,E),subsS(C,F).



subsS(C,D):-subsS(C,D,[]).


%Redondant : subsS(and(B,D),and(E,F)):-subsS(B,E), subsS(B,F),subsS(D,E), subsS(D,F). 
/*Quantification existentielle
some(R).*/

/**/


