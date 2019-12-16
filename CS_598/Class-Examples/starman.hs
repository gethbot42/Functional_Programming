-- starman.hs
-- Hangman clone exercise
-- we make small functions to build a big one

main = do
   putStrLn "Enter the secret word:"
   word <- getLine
   putStrLn "Enter the number of guesses allowed (stars):"
   nStars <- getLine
   let nStars' = read nStars :: Int
   starman word nStars'

-- Check the player's guess, whether single char is written within hidden word
check :: String -> String -> Char -> (Bool, String)
check word display c 
   = (c `elem` word, [if x == c then c else y | (x, y) <- zip word display])

-- Turn function
-- Called each time that the player is prompted for a letter.
-- Would look better using guards.
turn :: String -> String -> Int -> IO ()
turn word display nStars =
   do if nStars == 0 then 
         putStrLn "You lose." 
      else if word == display then
              putStrLn "You win."
           else getGuess word display nStars

turn' :: String -> String -> Int -> IO ()
turn' word display nStars 
   | nStars == 0 = putStrLn "You lose."
   | word == display = putStrLn "You win."
   | otherwise = getGuess word display nStars

-- Get Player's guess
-- Grab a line of input , but only use 1st character.
getGuess :: String -> String -> Int -> IO ()
getGuess word display nStars = do
   putStrLn (display ++ "  " ++ take nStars (repeat '*'))
   putStr "  Enter your guess: "
   q <- getLine
   let (correct, display') = check word display (q !! 0)
   let nStars' = if correct then nStars else nStars - 1
   turn word display' nStars'
-- mutually recursive w/ turn



-- Top-Level function
-- Usage: starman "secretword" numberOfStars
starman :: String -> Int -> IO ()
starman word nStars = turn' word ['-' | x <- word] nStars