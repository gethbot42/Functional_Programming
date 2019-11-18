-- printFactorial.hs

printFactorial 1 = putStrLn "1"
printFactorial n = do
   putStr (show n ++ " * ")
   printFactorial (n - 1)