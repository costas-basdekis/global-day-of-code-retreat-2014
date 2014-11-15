module Main where

import Data.List

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show, Ord)

type Conway = [Cell]

nextConway :: Conway -> Conway
nextConway xs@(_:y:_) = sort $ tail (reverse (tail xs))
nextConway _ = []
