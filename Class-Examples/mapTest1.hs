-- mapTest1.hs

myList 2 = [("Eenie", 16), ("Meenie", 18), ("Miney", 21), ("Mo", 50)]
myFn :: (String, Integer) -> String
myFn tup
   | age == 16 = print' ++ "\n\tcan drive"
   | age == 18 = print' ++ "\n\tcan drive"
   | age == 21 = print' ++ "\n\tcan drink"
   | age == 50 = print' ++ "\n\told boi"
   where
      age = sec tup
	  name = fst tup
	  age' = show age
      print' =  name ++ ", age " ++ age'