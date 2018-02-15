module BowlingSpec where

import SpecHelper

testScoreGame :: [Int] -> Int -> Spec
testScoreGame rolls score =
  it (printf " %s => %d \n" (show rolls) score) $
    scoreGame rolls `shouldBe` score

spec :: Spec
spec = do
  describe "all zeroes" $ do
    testScoreGame (replicate 20 0) 0
  describe "all ones" $ do
    testScoreGame (replicate 20 1) 20
  describe "one spare" $ do
    testScoreGame ([5, 5, 3] ++ (replicate 17 0)) 16
  describe "one strike" $ do
    testScoreGame ([10, 3, 4] ++ (replicate 16 0)) 24
  describe "perfect game" $ do
    testScoreGame (replicate 12 10) 300


main :: IO ()
main = hspec spec
