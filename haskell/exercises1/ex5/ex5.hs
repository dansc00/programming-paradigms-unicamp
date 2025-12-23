-- Programa que imprima o último elemento de uma lista

lastElement [] = error "Lista vazia"
lastElement [x] = x
lastElement (x:xs) = lastElement xs

main = do
    let list = [1,2,3]
    let lastElem = lastElement list
    print lastElem
    