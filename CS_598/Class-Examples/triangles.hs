-- triangles.hs
-- Todd Qualiano

-- This program prompts the user for three inputs and asks whether the three
-- input numbers can form a valid triangle.  The output displayed ("Yes." or 
-- "No." depends on what is returned by the function validTriangle which returns true 
-- if the sum of any two is always greater than the third and false otherwise.
-- If validTriangle returns True we print "Yes." and "No." is printed otherwise.

main = do
   putStrLn "Enter 3 numbers:"
   a <- getLine
   b <- getLine
   c <- getLine
   let a' = read a :: Double
   let b' = read b :: Double
   let c' = read c :: Double
   putStr "Do the numbers "
   putStr ((show a) ++ ", " ++ (show b) ++ ", and " ++ (show c))
   putStrLn " form a valid triangle?"
   if validTriangle a' b' c' then putStrLn "Yes." else putStrLn "No."


validTriangle :: Double -> Double -> Double -> Bool
validTriangle a b c
   | (a + b) <= c = False
   | (a + c) <= b = False
   | (b + c) <= a = False
   | otherwise = True

-- Written again here for personal testing
ulam :: Integer -> String
ulam 1 = "1"
ulam x
   | odd x     = show x ++ " -> " ++ ulam ((3*x) + 1)
   | otherwise = show x ++ " -> " ++ ulam ((x `div` 2))