-- Programa que intercala 2 listas, exibindo o restante. Ex: [1,2,6,7] e [3,5,8] = [1,3,2,5,6,8,7]

inter [] ys = ys
inter xs [] = xs
inter (x:xs) (y:ys) = x:y:inter xs ys

main = 
    do
    let list1 = [1,2,6,7]
    let list2 = [3,5,8]
    let res = inter list1 list2
    print res