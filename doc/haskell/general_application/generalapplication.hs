{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Main where

import Control.Monad.Trans.State (StateT, runStateT)
import Control.Monad.State (MonadState, get, put)
import Control.Monad.Trans.Reader (ReaderT, runReaderT)
import Control.Monad.Reader (MonadReader, ask)
import Control.Monad.IO.Class (MonadIO, liftIO)

data ApplicationState = ApplicationState
data ApplicationConfig = ApplicationConfig

type ProgramInterface m =
  ( MonadState ApplicationState m
  , MonadReader ApplicationConfig m
  , MonadIO m
  )

stuff :: ProgramInterface m => m ()
stuff = do
  liftIO $ print "kutyus"
  s <- get
  put s
  env <- ask
  return ()

newtype Application a =
  Application { run :: StateT ApplicationState (ReaderT ApplicationConfig IO) a } deriving
    ( Functor
    , Applicative
    , Monad
    , MonadIO
    , MonadState ApplicationState
    , MonadReader ApplicationConfig
    )

runApplication :: Application a -> ApplicationConfig -> ApplicationState -> IO (a, ApplicationState)
runApplication app conf initialState = runReaderT (runStateT (run app) initialState) conf

main :: IO ()
main = do
  runApplication stuff ApplicationConfig ApplicationState
  return ()
