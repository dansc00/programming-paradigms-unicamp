-- Programa que soma os valores pares em uma lista

isEven x = if x `mod` 2 == 0
    then True
    else False

evenSum [] = 0
evenSum (x:xs) = if isEven x == True
    then x + evenSum xs
    else evenSum xs

main = do
    let list = [2,4,3,7,6,10]
    let res = evenSum list
    print res