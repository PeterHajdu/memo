module Main where

import Test.Hspec

withApp :: (Int -> IO a) -> IO a
withApp action = do
  putStrLn "before action"
  a <- action 10
  putStrLn "after action"
  return a


main :: IO ()
main = hspec $ around withApp $ do
  describe "describe something" $ do
    it "first it" $ \ num -> do
      putStrLn $ "num in it 1 " ++ show num
      True `shouldBe` True

    it "second it" $ \ num -> do
      putStrLn $ "num in it 2 " ++ show num
      True `shouldBe` True

