sumX [] _ = []
sumX (x:xs) acc = acc+x : sumX xs (acc+x) 

cumSum [] = []
cumSum xs = sumX xs 0

main=
    do  
    let res = cumSum [5,10,2,3]
    print res