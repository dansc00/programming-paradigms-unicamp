trocaTodos _ _ [] = []
trocaTodos a b (x:xs)
    | x == a = b:trocaTodos a b xs
    | otherwise = x:trocaTodos a b xs

main=
    do
    let res = trocaTodos 4 10 [1,2,3,4,5,4,6,7,4]
    print res 