{-
randomseating.hs

Our group attempted to complete the requirements of the project without
hard-coding any values.  If a user inputs all (ex: ___ ) values provided
within the input prompts, then the user will recieve the output required
for the project.  However, one can customize room name, seat name, seat numbers,
number of seats per row, and imported roster list depending on their 
inputs into the command line. 

Authors:
   Joseph Alicea
   Todd Qualiano
   Martin Vadakara
-}
module Main where

import System.IO
import System.Random
import System.Random.Shuffle
import Data.List

-- Main method
-- Prompts user to enter room number and roster file to be used
-- for the randomizeSeating function.
main = do
   putStrLn "\n\nWelcome to the Random Seat Selector"
   putStrLn "\nPlease enter your room number (ex: HH 305):"
   room <- getLine
   putStrLn "Enter the file name of student roster (ex: roster):"
   roster <- getLine
   randomizeSeating room roster

-- Reads a text file of student names to be placed in seats.  The list
-- of seats is generated by the getSeatNames function.  Student names
-- and seat lists are made to be the same size, shuffled, zipped, and
-- then sorted by seat number.  The tuples are then printed on the command
-- line through the printPairs funtion by the number of rows indicated.
-- readRoster :: String -> [String]
randomizeSeating room roster = do
   rng <- newStdGen -- a random number generator
   rng' <- newStdGen
   roster' <- readFile roster
   let studentList = lines roster'
   
   -- The following prompts user for inputs regarding seat names and numbers
   putStrLn "Enter seat or machine header (ex: cssemaclin):"
   header <- getLine
   putStrLn "Enter lowest seat number (ex: 2):"
   low <- getLine
   putStrLn "Enter highest seat number (ex: 25):"
   high <- getLine
   let low' = read low :: Int
   let high' = read high :: Int
   let seatNames = getSeatNames header low' high'
   putStrLn "Enter the number of seats per row (ex: 6)"
   rowN <- getLine
   let rowN' = read rowN :: Int
   -- Prints a warning message if there are more students in the roster than seats
   if length seatNames < length studentList
      then putStrLn "Warning: There are less seats than students" 
   else putStrLn ("\n" ++ room ++ " EXAM RANDOMIZED SEATING")
   let studentList' = addListLength studentList (length seatNames)
   let shuffStudentList = shuffle' studentList' (length studentList') rng
   let shuffSeatNames = shuffle' seatNames (length seatNames) rng'
   let seatStudentPair = zip shuffSeatNames shuffStudentList
   
   printPairs (sort seatStudentPair) 1 rowN'

-- Generate the names of the seats without hard-coding Strings.
-- header is a String which acts as a room or machine type name.
-- low and high are Int(s) to represent which machine numbers students can sit at. 
getSeatNames :: String -> Int -> Int -> [String]
getSeatNames header low high = [ if x >= 10 then 
                                    header ++ show x
                                 else header ++ "0" ++ show x 
                               | x <- [low..high]]

-- Print seat student pairs into rows.                               
printPairs [] n rowN= putStrLn ""
printPairs (x:xs) n rowN
   | mod ((length xs) + 1) rowN == 0 = 
     do
        putStrLn ("-----\n" ++ "ROW " ++ show n ++ "\n-----")
        putStrLn (fst x ++ "\t" ++ snd x)
        printPairs xs (n + 1) rowN
   | otherwise = 
     do
        putStrLn (fst x ++ "\t" ++ snd x)
        printPairs xs n rowN
        
-- Adds empty Strings to a list of Strings to make it as long as the Int n
addListLength :: [String] -> Int -> [String]
addListLength xs n
   | length xs < n = addListLength ("" : xs) n
   | otherwise = xs