/*Projet LRC-TME3*/
/*Manipulation sur les listes*/
/* Auteurs: Arthur Ramolet et Morane Gruenpeter*/
%Exercice1.1
:-include(tme8definitions).
:-include(tme8allen).

%1.2
/*L2 contient la liste des relations transposees a partir de L1  */
%condition d'arret les deux listes sont vides
transposeListe([],[]).
%verification si l'element T1 est bien transpose de T2 puis recursivement sur le reste de la liste
transposeListe([T1|Q1],[T2|Q2]):-transpose(T1,T2),transposeListe(Q1,Q2).

/*L2 contient la liste des relations symetriques a partir de L1 */
%condition d'arret les deux listes sont vides
symetrieListe([],[]).
%verification si l'element T1 est bien symetrique de T2 puis recursivement sur le reste de la liste
symetrieListe([T1|Q1],[T2|Q2]):-symetrie(T1,T2),symetrieListe(Q1,Q2).

%1.3
/*Le predicat compose: L est la liste des relations que l'on peut obtenir par composition des relations R1 et R2, 
en utilisant le predicat compositionBase defini en tm8definitions.pl qui represente le tableau de composition
(dans tout les cas on trie la liste) */
compose(R,=,[R]).
compose(=,R,[R]).
%si la relation existe dans le tableau 
compose(R1, R2, L):-compositionBase(R1 , R2, S),sort(S,L).
%si les relations transposees de R1 ont une relation de composition avec R2
compose(R1, R2, L):-transpose(R2, X), transpose(R1, Y), compositionBase(X, Y, Z), transposeListe(Z,S),sort(S,L).
%si les relations symetriques de R1 ont une relation de composition avec R2
compose(R1, R2, L):-symetrie(R1, X), symetrie(R2, Y), compositionBase(X, Y, Z), symetrieListe(Z,S),sort(S,L).
%Combinaison de symetrie et de transposee
compose(R1, R2, L):-symetrie(R1, X), symetrie(R2, Y),transpose(X, B), transpose(Y, A), compositionBase(A, B, Z), transposeListe(Z,C),symetrieListe(C,S),sort(S,L).

%1.4
/*L est la liste des relations en composant la liste des relations  LR1 avec LR2.
En utilisant un predicat intermediair compositionListeD 
*/
compositionListeD(_,[],[]).
%on applique à chaque relation X le predicat compose avec T la tete de la list LR
compositionListeD(X, [T|Q], L):- compose(X,T,R1), compositionListeD(X,Q,R2), union(R1,R2,S),sort(S,L).
%pour chaque relation T on applique compositionListeD ci-dessus, puis recursivement sur tous les autres relations dans la liste LR1
compositionListe([],_,[]).
compositionListe([T|Q],R2,L):-compositionListeD(T,R2,L1),compositionListe(Q,R2,L2),union(L1,L2,S),sort(S,L).

%Exercice2
%2.2
/*Le predicat creation graphe prend une liste de relations L et ajoute recursivement 
chaque relation au graphe G*/
creationGraphe([], ([],[])).
creationGraphe([T|Q], G):-creationGraphe(Q,G1), ajouter(T,G1, G).

%2.3
/*interupt= instant ou je touche l'interupteur
lightOn= temps pendant lequel la lampe est allumee
jhonIn= temps pendant lequel Jhon est dans la piece
La relation r1 entre interupt et lightOn est (o,m)
La relation r2 entre lightOn et JhonIn est (<,m,mt,>)
Ci dessous la creationGraphe a faire afin de resoudre cet exemple
*/
ecrireGraphe1:- creationGraphe([rel(interupt,lightOn,[o,m]),rel(interupt,jhonIn,[<,m,mt,>])],G),
				write(G),
				fail.
ecrireGraphe1.
g1:- creationGraphe([rel(interupt,lightOn,[o,m]),rel(interupt,jhonIn,[<,m,mt,>])],G).
/* Le graphe qui correspond:
[lightOn,interupt,jhonIn],
[rel(interupt,lightOn,[o,m]),
rel(jhonIn,interupt,[>,mt,m,<]),
rel(jhonIn,lightOn,[<,=,>,d,e,mt,ot,s,st])]
*/
%avec la contrainte que jhon etait dans la piece lorsque la lumiere a ete allume

ecrireGraphe2:-creationGraphe([rel(interupt,lightOn,[o,m]),rel(interupt,jhonIn,[<,m,mt,>]),rel(lightOn,jhonIn,[d,o,s])],G),
				write(G),
				fail.
ecrireGraphe2.

%2.4
/*
L'exrecice du petite dejeuner
ij:Alfred lit son journal
id: Alfred prend son petit dejeuner
ic: Alfred boit son cafe
ip: Alfred se promene
*/
petitDej:-creationGraphe([rel(ij,id,[d,dt,e,et,s,st,ot,o,=]),rel(ij,ic,[e,et,=]),rel(id,ip,[<,m])],G),
				write(G),
				fail.
petitDej.
%2.5
/*Le predicat affiche, affiche les relations pour lesquelles intervient l'intervalle I  */
/*creationGraphe([], ([],[])).
creationGraphe([T|Q], G):-creationGraphe(Q,G1), ajouter(T,G1, G).
*/
%affiche(G,I):-(([],[]),_).
affiche(G,I):- write(L1),
			fail.
affiche.
%G est compose de deux listes: les intervalles et les relations
%afficheI([],_).
%afficheI([T|Q],I):- T=I, affiche(Q,I).



%2.6


