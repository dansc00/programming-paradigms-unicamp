-- projeto 1

trocaTodos _ _ [] = []
trocaTodos a b (x:xs)
    | x == a = b:trocaTodos a b xs
    | otherwise = x:trocaTodos a b xs

-- ######################################################

sumX [] _ = []
sumX (x:xs) acc = acc+x : sumX xs (acc+x) 

cumSum [] = []
cumSum xs = sumX xs 0

