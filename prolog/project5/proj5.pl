compressAux([], [], _). % a lista vazia comprimida é a própria lista vazia
compressAux([Fst], [[Fst,N]], N). % caso com 1 elemento, retorna a base da recursão

compressAux([Fst, Snd|Tail], Compressed, N) :- 
    Fst = Snd, % caso o elemento atual seja igual o próximo
    NN is N+1, % incrementa contador
    compressAux([Snd|Tail], Compressed, NN). % continua recursivamente

compressAux([Fst,Snd|Tail], [[Fst,N]|CompressedTail], N) :-
    % caso o elemento atual não seja igual ao próximo
    compressAux([Snd|Tail], CompressedTail, 1). % continua recursivamente, concatenando o resultado atual

compress(List, Compressed) :- 
    compressAux(List, Compressed, 1).
%-----------------------------------------------------------------------------------------------------------
decompressAux([], [], _). % a lista vazia descomprimida é a própria lista vazia

% avança recursivamente, repetindo elementos repetidos e retorna construindo a lista descomprimida
decompressAux([[Fst,Snd]|Tail], Decompressed, N) :-
    N =\= Snd,
    NN is N+1,
    decompressAux([[Fst,Snd]|Tail], DecompressedTail, NN),
    Decompressed = [Fst|DecompressedTail]. 

% avança recursivamente, passando para o próximo par [elemento, contador]
decompressAux([_|Tail], Decompressed, _) :-
    decompressAux(Tail, Decompressed, 0).
    
decompress(List, Decompressed) :-
    decompressAux(List, Decompressed, 0).