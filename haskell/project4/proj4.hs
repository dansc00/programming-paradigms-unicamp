-- Funções para obter o primeiro, segundo vértice e o peso de uma aresta
fstGraph :: (a, b, c) -> a
fstGraph (x,_,_) = x

sndGraph :: (a, b, c) -> b
sndGraph (_,x,_) = x

trdGraph :: (a, b, c) -> c
trdGraph (_,_,x) = x

-- Retorna os vizinhos de um vértice junto com os pesos das arestas
neighbors :: [(String, String, Int)] -> String -> [(String, Int)]
neighbors [] _ = []
neighbors ((v1, v2, w):xs) vertex
    | v1 == vertex = (v2, w) : neighbors xs vertex
    | v2 == vertex = (v1, w) : neighbors xs vertex
    | otherwise    = neighbors xs vertex

-- Função para atualizar a lista de distâncias
updateDistance :: String -> Int -> [(String, Int)] -> [(String, Int)]
updateDistance _ _ [] = []
updateDistance vertex newDist ((v, d):xs)
    | vertex == v = (v, newDist) : xs
    | otherwise   = (v, d) : updateDistance vertex newDist xs

-- Encontra o vértice com a menor distância na lista de vértices não visitados
findMinVertex :: [(String, Int)] -> [String] -> String
findMinVertex [] _ = error "Nenhum vértice"
findMinVertex ((v, d):vs) unvisited
    | v `elem` unvisited = findMinVertexHelper vs v d unvisited
    | otherwise          = findMinVertex vs unvisited

findMinVertexHelper :: [(String, Int)] -> String -> Int -> [String] -> String
findMinVertexHelper [] minV _ _ = minV
findMinVertexHelper ((v, d):vs) minV minD unvisited
    | v `elem` unvisited && d < minD = findMinVertexHelper vs v d unvisited
    | otherwise = findMinVertexHelper vs minV minD unvisited

-- Implementação do algoritmo de Dijkstra
dijkstra :: [(String, String, Int)] -> [(String, Int)] -> [String] -> String -> String -> [(String, Int)]
dijkstra _ distances [] _ _ = distances
dijkstra graph distances unvisited origin destination =
    let currentVertex = findMinVertex distances unvisited
        newUnvisited = filter (/= currentVertex) unvisited
        currentDist = lookupDistance currentVertex distances
        currentNeighbors = neighbors graph currentVertex
        updatedDistances = updateDistances currentVertex currentDist currentNeighbors distances
    in if currentVertex == destination
       then updatedDistances
       else dijkstra graph updatedDistances newUnvisited origin destination

-- Função auxiliar para obter a distância de um vértice
lookupDistance :: String -> [(String, Int)] -> Int
lookupDistance _ [] = error "Vértice não encontrado"
lookupDistance vertex ((v, d):xs)
    | vertex == v = d
    | otherwise   = lookupDistance vertex xs

-- Atualiza as distâncias dos vizinhos
updateDistances :: String -> Int -> [(String, Int)] -> [(String, Int)] -> [(String, Int)]
updateDistances _ _ [] distances = distances
updateDistances vertex currentDist ((neighbor, weight):ns) distances =
    let neighborDist = lookupDistance neighbor distances
        newDist = currentDist + weight
    in if newDist < neighborDist
       then updateDistances vertex currentDist ns (updateDistance neighbor newDist distances)
       else updateDistances vertex currentDist ns distances

-- Inicializa as distâncias para todos os vértices
initializeDistances :: [(String, String, Int)] -> String -> [(String, Int)]
initializeDistances [] _ = []
initializeDistances graph origin =
    let vertices = uniqueVertices graph
    in [(v, if v == origin then 0 else maxBound) | v <- vertices]

-- Obtém a lista de vértices únicos do grafo
uniqueVertices :: [(String, String, Int)] -> [String]
uniqueVertices [] = []
uniqueVertices ((v1, v2, _):xs) = v1 : v2 : uniqueVertices xs

-- Remove duplicatas de uma lista
removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs)
    | x `elem` xs = removeDuplicates xs
    | otherwise   = x : removeDuplicates xs

-- Função principal que encontra o menor caminho usando Dijkstra
shortestPath :: [(String, String, Int)] -> String -> String -> Int
shortestPath graph origin destination =
    let initialDistances = initializeDistances graph origin
        allVertices = removeDuplicates (uniqueVertices graph)
        finalDistances = dijkstra graph initialDistances allVertices origin destination
    in lookupDistance destination finalDistances

main = do
    let graph = [("1", "2", 7), ("1", "3", 9), ("1", "6", 14), ("2", "3", 10), ("2", "4", 15), ("3", "4", 11), ("3", "6", 2), ("4", "5", 6), ("5", "6", 9)]
    let origin = "1"
    let destination = "5"
    let result = shortestPath graph origin destination
    print result
