-- assignment3.hs


-- problem 1

intsFromTo :: Int -> Int -> [Int]
intsFromTo m n
   | m > n = []
   | otherwise = m : intsFromTo (m + 1) n

-- Assignment requires this to be recursive, however, this is simpler.
intsFromTo' m n = map (+ m) [0 .. n - m]


-- problem 2

removeOdd [] = []
removeOdd (n:ns) =
   if even n then
      n : removeOdd ns
   else
      removeOdd ns


-- problem 3

countTrue [] = 0
countTrue (x:xs) = 
    if x == True then
       1 + countTrue xs
    else
       countTrue xs


-- problem 4
        
removeOdd' ns = [n | n <- ns, even n]


-- problem 5

nonEmptyStr :: String -> Bool
nonEmptyStr s = 
   if s == "" then
      False
   else
      True
      
      
-- problem 6

replaceEmptyStr :: String -> String
replaceEmptyStr s = 
   if s == "" then
      "-1"
   else
      s