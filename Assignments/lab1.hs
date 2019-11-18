-- Todd Qualiano
-- Lab 1

--Multiply the first 5 positive numbers (1-5)
mult5 = product [1..5]

--Multiply the first 30 positive numbers (1-30)
mult30 = product [1..30]

--Add the numbers from 1 to 100
add100 = sum [1..100]

--Add the odd numbers from 1 to 99
addOdds = sum [1, 3..99]

--What is the remainder when 456 is divided by 10?
rem456 = mod 456 10

--What is the remainder when 365 is divided by 7?
rem365 = 365 `mod` 7

--Produce the first letter of the string "first".
letter1 = head "first"

--Drop the first letter from the string "rest".
dropLetter1 = tail "rest"
dropLetter1' = drop 1 "rest"

--Get the second letter of the string "Haskell".
secondLetter = head (tail "Haskell")


--In lab1.hs, define a function 2ndLastElem that finds the 2nd to last
--element of a list. When you test the function in ghci, it should work
--like this:

--Prelude> 2ndLastElem [1,2,3,4]
--3
--Prelude> 2ndLastElem ['a'..'z']
--'y'

--secondLastElem :: [a] -> a; This type definition is not needed.
secondLastElem x = x !! ((length x) - 2)
secondLastElem' x = last (init x)