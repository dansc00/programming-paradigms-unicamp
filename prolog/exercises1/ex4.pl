% Programa que recebe uma lista e um elemento, retorna a posição do elemento na lista ou false caso o elemento não esteja na lista

pos([], _, false).

pos([H|_], E, 1) :-
    H = E.

pos([_|T], E, P) :-
    pos(T, E, PP),
    PP \= false,
    P is PP+1.