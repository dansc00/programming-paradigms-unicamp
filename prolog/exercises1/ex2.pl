% Programa que recebe uma lista e retorna a soma dos elementos em posições pares

evenSumAux([], _, 0).

evenSum(L, S) :-
    evenSumAux(L, 1, S).

evenSumAux([_|T], I, S) :-
    I mod 2 =:= 1,                  
    II is I + 1,                  
    evenSumAux(T, II, S).       

% Regra para posição par: Soma o elemento e continua
evenSumAux([H|T], I, S) :-
    I mod 2 =:= 0,                  
    II is I + 1,                  
    evenSumAux(T, II, SS),      
    S is SS + H.                

      