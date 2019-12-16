-- Todd Qualiano
-- a personal guide to assignment1

x = 4
-- x = ((x * 2)); Illegal since x is immutable one it is declared.

y = 10 `div` 6
y' = 10 / 6
y'' = 10 / 5

num = 456
num' = mod (div num 10) 10

-- z = abs -6 illegal since -6 is not recognized as a number
z = abs (-6)
z' = -6
z'' = abs z'

a = -6 + 5
-- a' = 5 + -6 illegal 

myCombo = [1, 2, -5, -5, 5.1]
-- myCombo' = [1, 'a', "auto"] illegal since the items of the list are not of the same type

myDuck = "Daffy"
myDuck' :: String
myDuck' = "Donald"

myString :: String
myString = "String"
myString' = take 2 myString

firstName :: String
lastName :: String
firstName = "daffy"
lastName = "duck"
  
f = head firstName
la = take 2 lastName
fla = f : la

greetName :: String -> String
greetName name = "Hello, " ++ name ++ "!"