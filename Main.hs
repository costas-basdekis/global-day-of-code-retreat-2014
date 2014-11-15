module Main where

import Data.List

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show, Ord)

type Conway = [Cell]

nextConway :: Conway -> Conway
nextConway xs@(_:_:_) = (tail . reverse . tail) xs
nextConway _ = []

--isAlive :: Cell -> Conway -> Bool
--isAlive = elem
