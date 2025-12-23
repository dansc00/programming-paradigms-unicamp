% Programa que recebe uma lista e retorna o tamanho dela

len([], 0).

len([_|Tail], N) :- len(Tail, NN) , N is NN+1.