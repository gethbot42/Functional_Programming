--basicIO.hs
--compilable and runnable haskell program. we are not tied to the 
--interactive part of ghci

--module Main where

-- Indentation matters since we do not have braces
-- It seperates blocks of code.  Below we see
-- indentation to define the do block.
main = do
  putStrLn "Enter your num:"
  x <- getLine
  let xx = read x :: Integer
  let y = doubleSmallNumber xx
  putStr "Your num is "
  print y
  -- We could use show function instead of above
  putStr (show y)

doubleSmallNumber x = if x > 100 then x else x * 2

--same as above function, but uses guards
doubleSmallNumber' x
  | x > 100 = x
  | otherwise = x * 2