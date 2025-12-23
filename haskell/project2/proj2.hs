execComprimir [] _ = []
execComprimir [x] count = [(x,count+1)]
execComprimir (x:xs) count
    | next == x = execComprimir xs (count+1)
    | otherwise = (x,count+1) : execComprimir xs 0 
    where
        next = head xs

execDescomprimir [] _ = []
execDescomprimir (x:xs) count
    | count < (nElems-1) = elem : execDescomprimir (x:xs) (count+1)
    | otherwise = elem : execDescomprimir xs 0
    where
        elem = fst x
        nElems = snd x  

comprimir [] = []
comprimir list = execComprimir list 0

descomprimir [] = []
descomprimir list = execDescomprimir list 0 