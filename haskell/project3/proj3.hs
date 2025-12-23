
import qualified Data.Map.Strict as Map
import qualified Data.Char as DC 

-- recebe chave e contador em formato de lista de tuplas, incrementa contador da tupla que possui a chave passada
incrementar chave contador = Map.insertWith (+) chave 1 contador

-- constrói contador em formato de lista de tuplas
construirContador [] contador = contador
construirContador (x:xs) contador = construirContador xs contadorAtualizado
    where
        contadorAtualizado = incrementar x contador

-- retorna chave associada ao maior valor do contador
filtraMaximo [] max chave = chave
filtraMaximo (x:xs) max chave
    | (snd x) > max = filtraMaximo xs (snd x) (fst x)
    | otherwise = filtraMaximo xs max chave 

-- retorna letra com mais ocorrências
letraMaisComum string = res
    where
        stringFiltrada = map (\x -> DC.toLower x) (filter (\ x -> (x >= 'a' && x <= 'z') || (x >= 'A' && x <= 'Z')) string) -- string com apenas letras minusculas
        contadorInicial = Map.empty
        contadorFinal = Map.toList (construirContador stringFiltrada contadorInicial)
        res = filtraMaximo contadorFinal 0 ' ' 

main = 
    do
    let string = "77,88 a!? abc BB 8 8    8  fyt"
    let res = letraMaisComum string
    print res