-- Programa que inverta uma lista
-- Versão fold right

-- reverte lista adicionando elementos da cabeça ao final da lista (operador ++ adiciona ao fim da lista)
rev1 [] = []
rev1 (x:xs) = rev1 xs ++ [x]

main = do
	let list = [1,2,3,4]
	let revList = rev1 list
	print revList