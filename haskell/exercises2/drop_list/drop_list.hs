-- Programa que receba uma lista e dois valores n e a. Remove os n elementos a da lista

dropList _ _ [] = []
dropList 0 _ xs = xs
dropList n a (x:xs)
    | x == a = dropList (n-1) a xs
    | otherwise = x:dropList n a xs

main = 
    do
    let res = dropList 2 4 [2,3,4,5,4,3,2,1,4,4,3]
    print res 
