module Main where

import Control.Category
import Prelude hiding (id, (.))

newtype SimpleFunc a b = SimpleFunc {runFunc :: a -> b}

instance Category SimpleFunc where
  (SimpleFunc f) . (SimpleFunc g) = SimpleFunc (f . g)
  id = SimpleFunc id

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

main :: IO ()
main = mapM_ putStrLn $ (runFunc <$> categories) <*> (pure (-1))
