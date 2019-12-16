-- a function using a local variable with the where syntax
heronTriArea a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where s = (a + b + c) / 2
  
  
 -- let...in syntax. We let <variable bindings> in <expression>
 -- let cannot be used across guards, when where can span guards.
heronTriArea' a b c =
  let s = (a + b + c) / 2
  in sqrt(s * (s - a) * (s - b) * (s - c))