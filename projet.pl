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

/*Le carnivore étant par définition un consomateur exlusif de viande, nous nous passerons du Exclusif qui dans ce contexte tient lieu de pléonasme.*/

subs(carnivore,all(mange,animal)).
subs(animal,all(mange,plante)).

subs(lion,carnivore).
subs(carnivore,predateur).
subs(animal,some(mange)).
subs(nothing,and(all(manger,nothing),some(mange))). %Question pour vérification.

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

    subsS(C,D,L):-subs(C,Z),Z\==D,not_member(Z,L),subsS(Z,D,[Z|L]).

/*******************************************************************************/
/*Intersection en exercice 3
*
*/  %Permet d'effectuer une requête de type, A subs B and C.
    subsS(A,and(E,D),L):-subs(A,and(_,Z)),subs(A,and(X,_)),subsS(X,E,L),subsS(Z,D,L).
    subsS(A,and(E,D),L):-subs(A,and(Z,_)),subs(A,and(_,X)),subsS(X,E,L),subsS(Z,D,L).


    %Permet de gérer le cas particulier ou A subs B subs C -> A subs B and C (A reverifier)
        subsS(A,and(D,_),L):-subs(A,Z),subsS(Z,D,L).
        subsS(A,and(_,D),L):-subs(A,Z),subsS(Z,D,L).
        
        %Ca je sais plus, il faut que je relise
        subsS(A,D,L):-subs(A,and(Z,_)),subsS(Z,D,L).
        subsS(A,D,L):-subs(A,and(_,Z)),subsS(Z,D,L).

    %Permet d'effectuer une requête de type, A and B subs C 
    subsS(and(A,B),C,L):-subs(and(Z,_),C),subs(and(_,X),C),subsS(Z,A,L),subsS(X,B,L).
    subsS(and(A,B),C,L):-subs(and(_,Z),C),subs(and(X,_),C),subsS(Z,A,L),subsS(X,B,L).
        %Il doit manquer un traitement pour faire des trucs, je sais pas trop.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


subsS(C,D):-subsS(C,D,[]).


%Redondant : subsS(and(B,D),and(E,F)):-subsS(B,E), subsS(B,F),subsS(D,E), subsS(D,F). 
/*Quantification existentielle
some(R).*/

/**/


