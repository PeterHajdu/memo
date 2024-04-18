module Main where

import Control.Category
import Control.Arrow
import Prelude hiding (id, (.))

newtype SimpleFunc a b = SimpleFunc {runFunc :: a -> b}

instance Category SimpleFunc where
  (SimpleFunc f) . (SimpleFunc g) = SimpleFunc (f . g)
  id = SimpleFunc id

instance Arrow SimpleFunc where
  arr = SimpleFunc
  first (SimpleFunc f) = SimpleFunc $ \(a, b) -> (f a, b)

plusTwo :: Num a => SimpleFunc a a
plusTwo = SimpleFunc (+2)

timesThree :: Num a => SimpleFunc a a
timesThree = SimpleFunc (*3)

toString :: Show a => SimpleFunc a String
toString = SimpleFunc show

plusTwotimesThree :: (Num a, Show a) => SimpleFunc a String
plusTwotimesThree = plusTwo >>> timesThree >>> toString

timesThreeplusTwo :: (Num a, Show a) => SimpleFunc a String
timesThreeplusTwo = toString <<< plusTwo <<< timesThree

categories = [plusTwotimesThree, timesThreeplusTwo]

split :: (Arrow a) => a b (b, b)
split = arr $ \x -> (x, x)

unsplit :: (Arrow a) => (b -> c -> d) -> a (b, c) d
unsplit f = arr $ \(b, c) -> f b c

plusPlusTwoTimesThree1 = split >>> (first plusTwo) >>> (second timesThree) >>> (unsplit (+))
plusPlusTwoTimesThree2 = split >>> (plusTwo *** timesThree) >>> (unsplit (+))
plusPlusTwoTimesThree3 = (plusTwo &&& timesThree) >>> (unsplit (+))
plusPlusTwoTimesThree4 = liftA2 plusTwo timesThree

main :: IO ()
main = do
  print $ runFunc plusPlusTwoTimesThree1 (-1)
  print $ runFunc plusPlusTwoTimesThree2 (-1)
  print $ runFunc plusPlusTwoTimesThree3 (-1)
  print $ runFunc plusPlusTwoTimesThree4 (-1)
