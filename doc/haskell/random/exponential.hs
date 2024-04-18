module Main where

import System.Random (RandomGen)
import Data.Random.Source.PureMT
import Data.RVar (sampleRVar)
import Data.Random.Distribution.Exponential (exponential)
import Control.Monad.State

startSessions :: State PureMT [Double]
startSessions = replicateM 100 $ sampleRVar (exponential 100)

main :: IO ()
main = do
  gen <- newPureMT
  print $ evalState startSessions gen
