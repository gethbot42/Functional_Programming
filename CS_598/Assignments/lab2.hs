-- Todd Qualiano
-- Lab 2

-- Part a) Sort two numbers

-- sort2 :: Int -> Int -> (Int, Int)
-- return a tuple where the smallest Int is first

sort2 :: Int -> Int -> (Int, Int)
sort2 x y
  | x > y = (y, x)
  | otherwise = (x, y)

--more efficient than above?
sort2' x y = if x > y then (y, x) else (x, y)


-- Part b) Compute account interest

-- interest :: Int -> Double
-- compute the yearly interest for a given amount of money.
-- input as Int for simplicity

interest x
  | x <= 999 = 0
  | x <= 4999 = (0.02 * x)
  | x <= 19999 = (0.04 * x)
  | otherwise = (0.05 * x)
  
interest' x
  | x <= 999 = r1
  | x <= 4999 = (r2 * x)
  | x <= 19999 = (r3 * x)
  | otherwise = (r4 * x)
  where r1 = 0; r2 = 0.02; r3 = 0.04; r4 = 0.05