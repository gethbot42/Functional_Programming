-- quiz1.hs

--submitted
largestOfThree :: Int -> Int -> Int -> Int
largestOfThree a b c 
   | a >= b = max a c
   | a >= c = max a b -- unecessary
   | otherwise = max b c
   
--revised by me
largestOfThree' :: Int -> Int -> Int -> Int
largestOfThree' a b c = if a >= b then max a c else max b c

--professor suggestions
--included 'standard' way
largestOfThree'' a b c = max a (max b c)
largestOfThree''' a b c = maximum [a, b, c]
  
comboString :: String -> String -> String
comboString s1 s2
   | length s1 > length s2 = s2 ++ s1 ++ s2
   | length s1 < length s2 = s1 ++ s2 ++ s1
   | otherwise = ""
   
minMaxPair xs = (minimum xs, maximum xs)