-- Programa que imprima a soma dos elementos nas posições pares de uma lista, a primeira posição da lista é a posição 1

isEven n = 
    if n < 0
    then error "índice inválido"
    else 
        if n `mod` 2 == 0
        then True
        else False

xsLength [] = 0
xsLength (x:xs) = xsLength xs + 1

evenSumPos [] = 0
evenSumPos (x:xs) = 
    if (isEven (xsLength xs)) == True
    then evenSumPos xs + x
    else evenSumPos xs

main= 
    do
    let list = [1,2,3,4,5,6,30,40]
    let res = evenSumPos list
    print res