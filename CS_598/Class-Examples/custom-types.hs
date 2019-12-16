-- custom-types.hs
--
-- Explore custom types
--
-- Store multiple values to create custom types
data Customer = Customer String String Double
   deriving Show
   
-- Define a Customer and its values
daffyDuck :: Customer
daffyDuck = Customer "Daffy Duck" "400 Cedar Ave" 100.00

-- Define a getBalance function for a Customer
getBalance :: Customer -> Double
--getBalance (Customer name address balance) = balance
getBalance (Customer _ _ balance) = balance

daffyBalance = getBalance daffyDuck


-- Define a type with limited possible values
-- Think of Rock, Paper, and Scissors as named constants (not strings)
data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper > Rock" -- Note: pattern matching
shoot Rock Scissors = "Rock > Scissors"
shoot Scissors Paper = "Scissors > Paper"
-- 3 more permutations
shoot _ _ = "Error" -- fall-through pattern

-- TYPE CLASSES --

-- include Num, Eq, Ord, and Show
-- Type classes correspond to sets of types with certain operations
-- defined for them.
-- Example:
-- :t (+) :: Num a => a -> a -> a

-- create Employee type
data Employee = Employee ( name :: String, 
                           position :: String)
                           idNum :: Int,         
                         ) deriving (Eq, Show)
						 
mickeyMouse = Employee (name = "Mickey Mouse", position = "Mascot", idNum = 1)
minnieMouse = Employee (name = "Minnie Mouse", position = "Mascot", idNum = 2)