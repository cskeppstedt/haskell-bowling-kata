module BowlingSpec where

import SpecHelper

testScoreGame :: String -> Int -> Spec
testScoreGame game score =
  it (printf "should return the score for game : %s --> %d \n" game score) $
    scoreGame game `shouldBe` score

spec :: Spec
spec = do
  describe "scoreGame" $ do
    testScoreGame"--------------------" 0

main :: IO ()
main = hspec spec
