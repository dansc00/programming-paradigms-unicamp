-- faça um programa que retorne o tamanho de uma lista

len [] = 0 
len (x:xs) = 1 + len xs

main = do
    let list = [1,2,3,4,5,10]
    let lenList = len list
    print lenList
