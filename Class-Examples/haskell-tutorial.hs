-- haskell-tutorial.hs  (-- is how you comment in haskell, also used as program name; .hs is common extension)
-- Start Haskell interactive shell: ghci (ghci is haskell interactive shell)
-- In ghci load this script with
--      :l haskell-tutorial

--ghci //in terminal
--Prelude> :l haskell-tutorial //after

--print something
--main = do 
--print "Hello, World"
-- :r compiles? 
-- *Main> main
-- Import modules
import Data.List
import System.IO

{-
Multiline comment
-}

-- DATA TYPES

-- Int : whole numbers from -2^63 to 2^63 (Types start w/ upper case)
-- :: Int defines maxInt as an IntmasInt = maxBound :: Int
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer : Unbounded Int

-- Float: Single precision floating point (:t can tell type of a variable)
-- Double: Double precision

bigFloat = 3.99999999999 + 0.000000000005

-- Bool: True or False (T and F are capitalized;
-- Char: Single unicod char, use single quotes
-- Tuple: Can store a  lost mad of various data types
-- built in types... we can define our own though

-- Declaring variable type
-- implicit declaration of type (Haskell chooses?): 
myInt = 5
-- on ghci try myInt then :t myInt
-- explicitly declare type:
myOtherInt :: Int
myOtherInt = 5
--ghci :t myOtherInt

-- MATH

sumOfVals = sum[1..1000]
--ghci sumOfVals
addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4 -- in java this is one. what is it now?
--we get 1.25

-- modulus operator, used as a prefix operator
modEx = mod 5 4 -- in java we use %
-- modulus operator, used as an infix operator
modEx' =  5 `mod` 4 -- ` on same key as ~

-- Negative numbers must be surrounded w/ ()
negNumEx = 5 + (-4)

--Build in math functions
piVal = pi
ePow9 = exp 9
logOf9 = log 9
square9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999

--also we have trig functions

-- Logical Operators
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

-- Lists

-- lists are singly linked and can only be expanded from the front
-- lists store elements of the same type.
-- we do not declare the type, Haskell infers type
primeNumbers = [3, 5, 7, 11]

-- Concatenate lists
morePrimes = primeNumbers ++ [13, 17, 19, 23, 29]

-- Use the "cons" operator to construct a list
favNums = 2 : 7 : 21 : 66 : []

--Use cons to add a value to the front of a list
morePrimes2 = 2 : morePrimes

-- List of Lists
-- the inner lists dont need to have the same number of elements
multList = [[3, 5, 7], [11, 13, 17, 19]]

-- Get the length of a list
lenPrime = length primeNumbers

-- reverse list
revPrime = reverse primeNumbers

-- Check for an empty list
isListEmpty = null primeNumbers

-- Access list element by index
secondPrime = primeNumbers !! 1

-- Get 1st element in list
firstPrime = head primeNumbers
-- Get last elements in list (get every element but the first)
lastPrime = tail primeNumbers
-- Get every element but the last
primeInit = init primeNumbers

-- Get n number of elements from list front
first3Primes = take 3 morePrimes2
-- Get remaining elements after dropping elements
remove3Primes = drop 3 morePrimes2

--chekc if an element exists in the list
is7inList = elem 7 morePrimes2
-- infix version
is7inList' = 7 `elem` morePrimes2

--get max value
maxPrime = maximum morePrimes2
--min value
minPrime = minimum morePrimes2
--sum values in list
sumPrimes = sum morePrimes2

-- Get the product of values in list
newList = [2, 3, 5]
prodPrimes = product newList

-- create list from range
zeroToTen = [0..10]

-- Create list of evens by defining first step
evenList = [2, 4 .. 20]

-- lists can contain almost any type
letterList = ['A', 'C' .. 'Z']

--Infinite Lists (possible from of Haskell laziness)
infinPow10 = [10, 20 ..]
first10Pow10 = take 10 infinPow10

-- NO REPETITION STRUCTURES
-- the repeat function repeas a value
many2s = take 10 (repeat 2)
--many2sTest = take 10 repeat 2 does not compile

-- the replicate function generates a value n times
many3s = replicate 10 3

-- the cycle function replicates a list infinitely
cycleList = take 10 (cycle [1,2,3,4,5])
many4s = take 10 (cycle [4]) --better off using repeat

-- LIST COMPREHENSIONS --
-- lu python list comprehensions
-- allow you to create lists from lists
-- from the idea of sets

-- perform some operation on all elements of a list by
-- drawing each element from a list one at a time, and then
-- storing the result in a new list
listTimes2 = [x * 2 | x <- [1..10]] --x acts as a variable here

-- We can filter the results with conditions
-- condition (predicate) here is x*3 <= 50.
listTimes3 = [x * 2 | x <- [1..20], x*3 <= 50]

-- Create list of values divisible by 13 and 9
-- We can seperate predicates with a comma or && operator (in special cases?)
divisibleBy9N13 = [x | x <- [1..500], mod x 13 == 0, mod x 9 == 0]

-- Create list of values divisible by 13 and 9 using infinite list
-- The predicate x <= 500 is not sufficient to terminate the list comprehension
divisibleBy9N13' = [x | x <- [1..], x <= 500, mod x 13 == 0 && mod x 9 == 0]

-- Replace each odd number > 10 w/ "GT" and < w/ "LT"
gtlt :: [Int] -> [String]
gtlt xs = [ if x < 10 then "GT" else "LT" | x <- xs, odd x]

-- Good examples
multipleLists1 = [x * y | x <- [2,5,9], y <- [8, 10, 11]]
multipleLists1' = [x * y | x <- [2,5,9], y <- [8, 10, 11], x*y > 50]

length'' xs = sum [1 | _ <- xs]

-- Function to take a string and remove all but uppercase
onlyUpperCase str = [ c | c <- str, c `elem` ['A' .. 'Z']]

-- List comprehension using multiple lists
-- generate multiplication table
multTable = [[x * y | y <- [1..10]] | x <- [1..10]] -- y 'loops' before x here

rightTriangles = [(a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2]

-- More list functions

-- Sort a list
sortedList = sort [9, 1, 8, 3, 4, 7, 6]

-- zipWith combines lists (does not concatonate)
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]

-- The filter function applies a condition to a list
listBiggerThan5 = filter (>10) sumOfLists

-- The takeWhile function returns a list of items until a condition is true
-- take items from a list while (*condition*) is true
evenUpTo20 = takeWhile (<=20) [2, 4 ..]
--startsWithS   = takeWhile (== "S") ["String","Stop","Test"]

-- foldl (fold left) applies an operation on each item of a list; foldr 
-- (fold right) does this from the right
multOfList = foldl (*) 1 [2, 3, 4, 5] --functions like factorial


-- TUPLES

-- Tuples can store a list of multiple types, with fixed size
randTuple = (1, "Random tuple")

-- A tuple pair stores 2 valuues
bobSmith = ("Bob Smith", 52)

-- Get first value of tuple
bobsName = fst bobSmith

-- Get Second value
bobsAge = snd bobSmith

-- Combine list values into tuple pairs using zip
names = ["Bob", "Mary", "Tom", "Test"]
addresses = ["123 Main", "234 North", "567 South"]

namesAndAddresses = zip names addresses

-- three tuples
threeTuple = (1, 2, "Three")
fourTuple = (1, 2, 3, "Four")

-- FUNCTIONS --

-- Functions names must begin with lower case.
-- In ghci, start function definitions with "let" (????????)

getTriple x = x*3

-- main is a function that can be called in the terminal
-- ghci with main 
main = do
  -- Print a string with a new line
  putStrLn "What is your name?"
  -- Get user input and store in name
  -- <- pulls entered name from an IO action
  name <- getLine

  putStrLn ("Hello, " ++ name)
  
-- Create function addMe
-- this time, start with a type declarations
-- similar to function prototype in C/C++
-- this is similar to declaring return type, type of parameters in java
-- functionName :: param1 -> param2 -> paramN -> returnType

addMe :: Int -> Int -> Int -- we must define this afterwards

-- General Function definition:
-- functionName param1 param2 paramN = operations

addMe x y = x + y

-- Can perform different function actions based on values
-- This concept is called pattern matching
whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You can drink"
--default
whatAge x = "What's your age"

--if else would be better structure than above, just an Ex

-- factorial function
factorial :: Int -> Int
-- Base case
factorial 0 = 1
-- Recursive call
factorial n = n * factorial(n-1)

-- More easily done using product
productFactorial n = product [1..n]

--function patter matching w/ lists
-- listInfo :: (Show a) => [a] -> String
listInfo [] = "The list is empty"  
listInfo (x:[]) = "The list has one element: " ++ show x
--listInfo [x] = ... is also a way to write above
listInfo (x:y:[]) = "The list has two elements: " ++ show x ++ ", " ++ show y
--listInfo [x,y] = ...
--listInfo (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ ", " ++ show y
listInfo [x,y,_] = "This list is long."

-- pattern matching to write a length function recursively
length' [] = 0 
length' (_:xs) = 1 + length' xs
-- we bind underscore to the first element and then recursively call
-- length' on the rest of the list.
-- we could have used x instead of _, but since we don't need to use _
-- it is fine to use it

-- function guard example
-- last guard is an optional otherwise (default / else case)
whatAge' age 
  | age == 16 = "You can drive."
  | age == 18 = "You can vote."
  | otherwise = "What is your age?"







