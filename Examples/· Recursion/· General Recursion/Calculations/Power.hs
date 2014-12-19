-- Power function. General Recursion.
module Power where



import Test.QuickCheck




power :: Integer -> Integer -> Integer
power basis exponent

 |  exponent < 0  = error "Power.hs: Negative exponent."
 |  otherwise     = power' basis exponent
 
 where
 
 power' :: Integer -> Integer -> Integer
 power' _ 0 =  1
 -- power' _ 1 =  2   -- [1]
 power' basis exponent
  
  |  even exponent  = power' (square basis) (halve exponent)
  |  otherwise      = basis * power' (square basis) (halve exponent)
 
 square :: Integer -> Integer
 square basis =  basis * basis
 
 halve :: Integer -> Integer
 halve exponent =  exponent `div` 2


{- GHCi>

power 2 0
power 2 1
power 2 2
power 2 3

-}
-- 1
-- 2
-- 4
-- 8



prop_power :: Integer -> (Positive Integer) -> Bool
prop_power basis (Positive exponent)

 =  power basis exponent == basis ^ exponent


-- GHCi> quickCheck prop_power




-- [1]
--
-- There would be an attempt to match this in every recursion step.
-- Under what condition(s) could this mathching be an advantage?
-- Under what condition(s) could this matching be a disadvantage?
-- Think about: recursion pattern, parallelism, optimization, complex data structures, ...




