{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import qualified Data.MessagePack as MP
import qualified Data.ByteString.Lazy as B
import Data.Maybe

data Message = Message
  { author :: !B.ByteString
  , parent:: !(Maybe B.ByteString)
  , content_type :: !B.ByteString
  , content :: !B.ByteString
  } deriving (Show)

data Frame = Frame
  { version :: !Int
  , message :: !B.ByteString
  , signature :: !B.ByteString
  } deriving (Show)

packMessage :: Message -> B.ByteString
packMessage (Message a p ct c) = MP.pack $ (a, maybeToList p, ct, c)

packFrame :: Frame -> B.ByteString
packFrame (Frame v m s) = MP.pack $ (v, m, s)

unpackFrame :: B.ByteString -> Maybe Frame
unpackFrame bytes = let frame = MP.unpack bytes :: (Maybe (Int, B.ByteString, B.ByteString))
                     in unpackInnerFrame <$> frame

unpackInnerFrame :: (Int, B.ByteString, B.ByteString) -> Frame
unpackInnerFrame (v, m, s) = Frame v m s

unpackMessage :: B.ByteString -> Maybe Message
unpackMessage bytes = let msg = MP.unpack bytes :: (Maybe (B.ByteString, [B.ByteString], B.ByteString, B.ByteString))
                       in unpackInnerMessage <$> msg

unpackInnerMessage :: (B.ByteString, [B.ByteString], B.ByteString, B.ByteString) -> Message
unpackInnerMessage (a, p, ct, c) = Message a (listToMaybe p) ct c



main :: IO ()
main = do
  let msg1 = Message "harcsabajusz" (Just "kapitany") "szaguldo" "kacsa"
  let f1 = Frame 1 (packMessage msg1) "invalid"
  print f1

  let sf1 = (packFrame f1)
  B.writeFile "1.kutyus" sf1

  let dsf1 = fromJust ((unpackFrame sf1) :: Maybe Frame)
  print $ dsf1
  print (unpackMessage (message dsf1) :: Maybe Message)
