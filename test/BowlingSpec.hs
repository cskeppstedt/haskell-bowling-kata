module BowlingSpec where

import SpecHelper

testScoreGame :: Int -> [Int] -> Spec
testScoreGame score rolls =
  it (printf " %s => %d \n" (show rolls) score) $
    scoreGame rolls `shouldBe` score

spec :: Spec
spec = do
  describe "all zeroes" $ do
    testScoreGame 0 (replicate 20 0)

  describe "all ones" $ do
    testScoreGame 20 (replicate 20 1)

  describe "all nines and misses" $ do
    testScoreGame 90 (concat $ replicate 10 [9,0])

  describe "all fives" $ do
    testScoreGame 150 (replicate 21 5)

  describe "one spare" $ do
    testScoreGame 16 ([5, 5, 3] ++ (replicate 17 0))

  describe "one strike" $ do
    testScoreGame 24 ([10, 3, 4] ++ (replicate 16 0))

  describe "perfect game" $ do
    testScoreGame 300 (replicate 12 10)


main :: IO ()
main = hspec spec
