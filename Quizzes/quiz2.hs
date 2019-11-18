-- quiz2.hs

-- problem 1

count9s :: Int -> Int
count9s 0 = 0
count9s n
   | n `mod` 10 == 9 = 1 + count9s (n `div` 10)
   | otherwise = count9s (n `div` 10)
   

-- problem 2
powerofN :: Int -> Int -> Int
powerofN base 1 = base
powerofN base n = base * powerofN base (n-1)


-- problem 3
-- [String] == [[Char]]
removeX :: String -> String
removeX "" = ""
removeX (s:ss)
   | s /= 'x' = s : removeX ss
   | otherwise = removeX ss
   

-- problem 4
removeX' :: String -> String
removeX' ss = [s | s <- ss, s /= 'x']


-- problem 5
removeX'' :: String -> String
removeX'' ss = filter (\s -> s /= 'x') ss


-- problem 6
dayAbbr :: Int -> String
dayAbbr 0 = "Sun"
dayAbbr 1 = "Mon"
dayAbbr 2 = "Tue"
dayAbbr 3 = "Wed"
dayAbbr 4 = "Thu"
dayAbbr 5 = "Fri"
dayAbbr 6 = "Sat"
dayAbbr n = "NA"

