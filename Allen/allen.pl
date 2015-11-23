:-include(tme8definitions).
:-include(tme8allen).

transposeListe([],[]).
transposeListe([T1|Q1],[T2|Q2]):-transpose(T1,T2),transposeListe(Q1,Q2).


symetrieListe([],[]).
symetrieListe([T1|Q1],[T2|Q2]):-symetrie(T1,T2),symetrieListe(Q1,Q2).

compose(R,=,[R]).
compose(=,R,[R]).
compose(R1, R2, L):-compositionBase(R1 , R2, S),sort(S,L).
compose(R1, R2, L):-transpose(R2, X), transpose(R1, Y), compositionBase(X, Y, Z), transposeListe(Z,S),sort(S,L).
compose(R1, R2, L):-symetrie(R1, X), symetrie(R2, Y), compositionBase(X, Y, Z), symetrieListe(Z,S),sort(S,L).
compose(R1, R2, L):-symetrie(R1, X), symetrie(R2, Y),transpose(X, B), transpose(Y, A), compositionBase(A, B, Z), transposeListe(Z,C),symetrieListe(C,S),sort(S,L).

compositionListeD(_,[],[]).
compositionListeD(X, [T|Q], L):- compose(X,T,R1), compositionListeD(X,Q,R2), union(R1,R2,S),sort(S,L).

compositionListe([],_,[]).
compositionListe([T|Q],R2,L):-compositionListeD(T,R2,L1),compositionListe(Q,R2,L2),union(L1,L2,S),sort(S,L).

creationGraphe([], ([],[])).
creationGraphe([T|Q], G):-creationGraphe(Q,G1), ajouter(T,G1, G).

%Question 3
%creationGraphe([rel(s,l,[o,m]),rel(s,r,[<,m,mt,>])],G),write(G).
%[l,s,r],[rel(s,l,[o,m]),rel(r,s,[>,mt,m,<]),rel(r,l,[<,=,>,d,e,mt,ot,s,st])]

