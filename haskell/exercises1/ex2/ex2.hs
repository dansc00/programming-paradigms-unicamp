-- Programa que receba um número e imprima quantas vezes ele aparece na lista

count _ [] = 0
count a (x:xs) = (if x == a then 1 else 0) + count a xs

main = do
    let list = [2,5,6,6,10,6,7,8,6]
    let countList = count 6 list
    print countList 

