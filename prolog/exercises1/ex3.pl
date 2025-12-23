% Recebe uma lista e um elemento. Retorna true se o elemento está na lista ou false caso contrário

elemAux([], _, false).

elemAux([H|_], E, R) :-
    H = E.

elemAux([_|T], E, R) :-
    elemAux(T, E, R).

elem(L, E) :- 
    elemAux(L, E, true).