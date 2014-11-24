module Main where

import Data.List

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show, Ord)

type Conway = [Cell]

nextConway :: Conway -> Conway
nextConway xs@(_:y:_) = filter (bothNeightboursAlive xs) xs
nextConway _ = []

leftOf (Cell x y) = Cell (x-1) y

rightOf (Cell x y) = Cell (x+1) y

isAlive conway cell = elem cell conway

bothNeightboursAlive conway cell = (isAlive conway (leftOf cell)) && (isAlive conway (rightOf cell))