% Programa que receba uma lista e um item, retorna uma nova lista com o item removido todas as vezes 

removeAll(_, [], []).

removeAll(X, [X|T], R) :-
    removeAll(X, T, R).

removeAll(X, [H|T], [H|R]) :- 
    X \= H, 
    removeAll(X, T, R).