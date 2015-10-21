/*Projet LRC-TME3*/
/*Manipulation sur les listes*/
/* Auteurs: Arthur Ramolet et Morane Gruenpeter*/

/*Le predicat concatene, la concatenation de deux listes*/
/*transforme ([a,b,c], [d],L) en L=[a,b,c,d] */
concatene([],X,X).
concatene([T|Q],Y,[T|Z]):-concatene(Q,Y ,Z).

/*Le predicat inverse */
/*transforme  ([a,b,c,d,) L2) en ([d,c,b,a])*/
inverse([X],[X]).
inverse([T|Q],Z):-inverse(Q,L),concatene(L,[T],Z).

/*Le predicat supprime */
supprime([],_,[]).
supprime([T|Q],Y,Z):-T==Y,supprime(Q,Y,Z).
supprime([T|Q],Y,[T|Z]):-T\==Y,supprime(Q,Y,Z).

/*Le predicat filtre*/
filtre(X,[],X).
filtre(X,[T|Q],Z):-supprime(X,T,Y),filtre(Y,Q,Z).

/*Palindromes*/
/*verifie si le mot est un palindrome en utilisant la fonction inverse*/
%condition d'arret la liste est vide
palindrome([]).
palindrome([T|Q]):-inverse([T|Q],[T2|Q2]),T==T2,supprime([T|Q],T,Y),palindrome(Y).

/*verifie  si le mot est un palindrome sans la fonction inverse*/
/*En utilisant le premier et le dernier element du mot avec les fonctions premier et dernier */
premier([T|Q], T, Q). 
dernier(T, L, Q) :- concatene(Q, [L], T). 
%condition d'arret la liste est vide ou un element
palindrome2([]).
palindrome2([_]).
%fonction recursive en verifiant le premier et le dernier element.
palindrome2(L):- premier(L,T,Q), dernier(T,L,Q), palindrome2(Q).
