{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Main where

import Control.Monad.Trans.State hiding (put, get)
import Control.Monad.IO.Class
import Control.Monad.State.Class
import Control.Monad
import Control.Monad.Loops

newtype MyState a = MyState {runMyState :: (StateT Int IO) a}
  deriving (Functor, Applicative, Monad, MonadIO, MonadState Int)

stuff :: MyState ()
stuff = do
  s <- get
  liftIO $ print s
  put $ s + 1

main :: IO ()
main = iterateM_ (execStateT $ runMyState stuff) 0
