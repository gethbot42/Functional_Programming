filter' :: (a -> Bool) -> [a] -> [a]
filter' pred [] = []
filter' pred (x:xs) 
   | pred x = x : filter' pred xs
   | otherwise = filter' pred xs