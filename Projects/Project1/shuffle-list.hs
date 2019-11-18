-- shuffle-list.hs
-- https://hackage.haskell.org/package/random-1.1/docs/System-Random.html
-- https://hackage.haskell.org/package/random-shuffle-0.0.4/docs/System-Random-Shuffle.html
-- https://www.schoolofhaskell.com/school/starting-with-haskell/libraries-and-frameworks/randoms

{-|
The required modules, System.Random and System.Random.Shuffle, are
installed on the Linux lab machines and Linux servers that you have access
to. But they may not be installed on your own computer, even after you've
installed the Haskell Platform. See the following instructions to address
this.

Check for required packages in ghci by running

   import System.Random
   import System.Random.Shuffle

If one or both are not installed, you will need to start a terminal and run
the following commands to install the random and random-shuffle modules.

   cabal update
   cabal install random
   cabal install random-shuffle

On macOS, if you installed the Haskell Platform, the System.Random module
may not be loadable until you run the following command:

   sudo ghc-pkg recache
-}

import System.Random
import System.Random.Shuffle

main = do
         rng <- newStdGen -- Get random number generator
         let xs = [1..10]
         let ys = shuffle' xs (length xs) rng
         print ys