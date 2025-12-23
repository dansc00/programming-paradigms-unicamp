% Programa que receba uma lista e um item, retorna uma nova lista com o item removido uma vez 

remove(_, [], []).
remove(X, [X|T], T).

remove(X, [H|T], R) :- 
    remove(X, T, RR),
    R = [H|RR].
