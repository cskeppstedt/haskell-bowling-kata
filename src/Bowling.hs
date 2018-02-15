module Bowling where

scoreGame :: [Int] -> Int
scoreGame [] = 0
scoreGame (r1:[]) = r1
scoreGame (r1:r2:[]) = r1 + r2
scoreGame (r1:r2:r3:[]) = r1 + r2 + r3
scoreGame (r1:r2:r3:rest)
  | r1 == 10 = r1 + r2 + r3 + (scoreGame (r2:r3:rest))
  | otherwise = case r1 + r2 of
     10 -> r1 + r2 + r3 + (scoreGame (r3:rest))
     _  -> r1 + r2 + (scoreGame (r3:rest))

