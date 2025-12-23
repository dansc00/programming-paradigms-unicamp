-- Programa que verifique se uma lista está ordenada crescentemente

verify [] = True
verify [_] = True
verify (x:y:xs) = 
    if (x <= y)
    then verify xs
    else False

main =
    do
    let list = [1,2,3,4,6,5]
    let res = verify list
    print res