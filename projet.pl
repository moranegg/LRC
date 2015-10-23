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
subs(all(mange,animal),carnivore).
subs(herbivore,all(mange,plante)).
subs(all(mange,plante),herbivore).

subs(lion,carnivore).
subs(carnivore,predateur).
subs(animal,some(mange)).
subs(and(all(manger,nothing),some(mange)),nothing). %Question pour vérification.

%subs(humain,mammifere).
%subs(chien,carnivore).

/*A-box*/
/*******************************************************************************/
inst(felix, chat).
inst(pierre, humain).
inst(marie, humain).
inst(princesse, chihuahua).
inst(jerry, souris).
inst(titi, canari).

instR(felix, mange, jerry).
instR(felix, mange, titi).
instR(felix, aMaitre, pierre).
instR(princesse, aMaitre, marie).



/*trouver si un element E n'est pas memebre d'une liste L*/
    not_member(_,[]).
    not_member(E,[T|Q]):-E\==T,not_member(E,Q).

/*******************************************************************************/
/*Operateurs*/
/*Subsomption en exercice 2.1
*ne permet pas de ____________________
*/
	/* solutions triviales */
		subS1(C,C). 
		subS1(C,D):-subs(C,D).
    /* Par transitivite */
		subS1(C,D):-subs(C,Z),Z\==D,subS1(Z,D).
    
/*****************************************************************************/
/*Subsomption en exercice 2.4
* en utilisant la fonction not_member, teste la condition que Z ne soit pas dans L
*/
	/* Permet la gestion masqué de la liste */
		subsS(C,D):-subsS(C,D,[]).
	/* Solutions triviales */
		subsS(C,C,_). 
		subsS(C,D,_):-subs(C,D). 
	/* Transitivité */
    	subsS(C,D,L):-subs(C,Z),Z\==D,not_member(Z,L),subsS(Z,D,[Z|L]).

/*******************************************************************************/
/*Intersection en exercice 3
*   *** Subsume indéfiniment les requètes type unification avec variable avec les parties b) et d) ***
*/ 

	 %a) Permet d'effectuer une requête de type, A subs B and C uniquement les cas contenant and, les traitements unitaires sont gérés par la partie c).
	    subsS(A,and(E,D),L):-subs(A,and(_,Z)),subs(A,and(X,_)),subsS(E,X,L),subsS(D,Z,L).
    	subsS(A,and(E,D),L):-subs(A,and(Z,_)),subs(A,and(_,X)),subsS(E,X,L),subsS(D,Z,L).


	%b) Devrait traiter des cas comme chihuahua,and(chien,animal) mais possède un comportement hasardeux.
        %subsS(A,and(D,_),L):-subs(A,Z),subsS(Z,D,L).
        %subsS(A,and(_,D),L):-subs(A,Z),subsS(Z,D,L).
        
    %c) Permet de gérer le cas particulier ou A subs (B and C) -> (A subs B) and (A subs C) (chihuahua subs mammfere)
        subsS(A,D,L):-subs(A,and(Z,_)),subsS(Z,D,L).
        subsS(A,D,L):-subs(A,and(_,Z)),subsS(Z,D,L).

    %d) Devrait permettre d'effectuer une requête de type, A and B subs C
		%subsS(and(A,B),C,L):-subs(and(Z,_),C),subs(and(_,X),C),subsS(Z,A,L),subsS(X,B,L).
		%subsS(and(A,B),C,L):-subs(and(_,Z),C),subs(and(X,_),C),subsS(Z,A,L),subsS(X,B,L).

		subsS(and(A,B),C,L):-subs(A,X),subs(B,Y),subsS(and(X,Y),C).
		%subsS(and(B,A),C,L):-subs(A,X),subs(B,Y),subsS(C,X,L),subsS(C,Y,L).
		%subsS(and(A,B),C,L):-subs(and(_,Z),C),subs(and(X,_),C),subsS(Z,A,L),subsS(X,B,L).

/*******************************************************************************/
/*Gestion des rôles en exercice 4
*   Traite les requêtes all uniquement.
*/  %	
	%Gère les cas A subs VR.C -> A subs VR.D si D subs C
		subsS(A,all(X,D),L):-subs(A,all(X,Z)),subsS(D,Z,L).

		%subsS(all(X,A),D,L):-subs(A,Z),subsS(all(X,Z),D,L).



%Redondant : subsS(and(B,D),and(E,F)):-subsS(B,E), subsS(B,F),subsS(D,E), subsS(D,F). 

%traitement des instances
%inst(I,C):- subs(C,Z),Z\==C, inst(I,D).




/*Exercice 4.5 Quantification existentielle
some(R).*/

/*Exercice 5*/
/* Il est complet quand toutes les déductions sémantiques peuvent se dériver dans le système. On parle de théorème de complétude quand il existe un système de déduction fidèle qui est complet (le système de déduction doit être raisonnable, c’est-à-dire que l'ensemble des preuves dans le système doit être récursif).
par exemple le chat qui mange les animaux mais il n'est pas carnivore, car ce n'était pas défini dans notre T-box
*/


