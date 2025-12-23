-- Programa que receba um valor e verifique se ele está em uma lista

inList _ [] = False
inList a (x:xs) = if x == a 
    then True 
    else inList a xs

main = do
    let list = [1,2,3,4,5]
    let elem = 2
    let res = inList elem list
    print res