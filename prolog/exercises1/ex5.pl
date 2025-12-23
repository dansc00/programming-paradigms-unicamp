% Programa recebe uma lista, um elemento e um acumulador. Retorna o número de vezes que um elemento aparece na lista

count([], _, 0).

count([E|T], E, N) :-
    count(T, E, NN),
    N is NN + 1.

count([_|T], E, N) :-
    count(T, E, N).
    


    
