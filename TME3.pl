concatene([],X,X).
concatene([T|Q],Y,[T|Z]):-concatene(Q,Y ,Z).

inverse([X],[X]).
inverse([T|Q],Z):-inverse(Q,L),concatene(L,[T],Z).

supprime([],_,[]).
supprime([T|Q],Y,Z):-T==Y,supprime(Q,Y,Z).
supprime([T|Q],Y,[T|Z]):-T\==Y,supprime(Q,Y,Z).

filtre(X,[],X).
filtre(X,[T|Q],Z):-supprime(X,T,Y),filtre(Y,Q,Z).

palindrome([]).
%palindrome([T|Q],[T2|Q2]):-T==T2,palindrome(Q,Q2).
palindrome([T|Q]):-inverse([T|Q],[T2|Q2]),T==T2,supprime([T|Q],T,Y),palindrome(Y).

palindrome2([],[]).
palindrome2([T|Q],[T2|Q2]):-T==T2,palindrome(Q,Q2).
palindrome2(X):-inverse(X,Y),palindrome(X,Y),!.
