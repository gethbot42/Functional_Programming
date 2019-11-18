-- quicksort.hs
-- examine higher-order functions

import Data.Char

-- Not a higher-order function since we only pass a list for the input arguments
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = (quickSort lessList) ++ (x:equalList) ++ (quickSort moreList)
   where
      lessList = filter (< x) xs
      equalList = filter (== x) xs
      moreList = filter (> x) xs
      
-- Higher-order version using compare as an input function
quickSort' :: (Ord a) => (a -> a -> Ordering) -> [a] -> [a]
quickSort' _ [] = []
quickSort' compare (x:xs) = (quickSort' compare less) ++ (x:equal) ++ (quickSort' compare more)
   where
      less = filter (\ y -> y `compare` x == LT) xs
      equal = filter (\ y -> y `compare` x == EQ) xs
      more = filter (\ y -> y `compare` x == GT) xs
      
-- We can build our own 'compare' functions to input into our quickSort' routine
-- When sorting strings capital letters are lexiographically less than lower case
-- letters.  This function maps all Char(s) in the input string to their upper case
-- version, essentially ignoring case when comparing.
insensitive :: [Char] -> [Char] -> Ordering
insensitive s1 s2 = compare (map toUpper s1) (map toUpper s2)

-- Write an ordering function for quickSort' that enables descending sort.
-- compareDesc = compare descending
compareDesc :: (Ord a) => a -> a -> Ordering
compareDesc x y
   | compare x y == LT = GT
   | compare x y == GT = LT
   | otherwise = EQ
   
-- So much simpler than above, and capture the 'essence' of the ideas above.
compareDesc' x y = compare y x

-- Same idea but using the flip function
compareDesc'' x y = flip compare x y