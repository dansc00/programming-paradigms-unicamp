-- Recebe uma posição n e imprime a lista invertida de n até a primeira posição

-- Recebe uma lista e um índice, retorna o elemento na posição do índice dado
getElement [] _ = error "Indice inválido"
getElement (x:xs) 0 = x
getElement (x:xs) n = getElement xs (n-1)

-- Recebe uma lista e um índice, retorna a lista invertida a partir do índice até a primeira posição
rangeRev [] _ = []
rangeRev [x] _ = [x]
rangeRev xs 0 = [getElement xs 0]
rangeRev xs n = getElement xs n : rangeRev xs (n-1)

main = do
    let list = [1,2,3,4,5,6,7,8,9,10]
    let revList = rangeRev list 3
    print revList