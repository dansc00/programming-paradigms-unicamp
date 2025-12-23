-- Programa que inverta uma lista
-- Versão fold left

-- reverte lista, adicionando elementos a uma nova lista auxiliar, retorna a lista auxiliar (operador : adiciona ao inicio da lista)
rev2 [] aux = aux
rev2 (x:xs) aux = rev2 xs (x:aux)

main = do   
    let list = [1,2,3,4]
    let aux = []
    let revList = rev2 list aux
    print revList