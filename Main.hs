module Main where

import Data.List

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show, Ord)

type Conway = [Cell]

nextConway :: Conway -> Conway
nextConway conway = filter (shouldBeAlive conway) conway

shouldBeAlive :: Conway -> Cell -> Bool
shouldBeAlive conway cell =
	((isAlive conway (leftOf cell)) && 
	(isAlive conway (rightOf cell))) ||
	((isAlive conway (aboveOf cell)) && 
	(isAlive conway (belowOf cell)))

leftOf :: Cell -> Cell
leftOf (Cell x y) = Cell (x-1) y

rightOf :: Cell -> Cell
rightOf (Cell x y) = Cell (x+1) y

aboveOf :: Cell -> Cell
aboveOf (Cell x y) = Cell x (y-1)

belowOf :: Cell -> Cell
belowOf (Cell x y) = Cell x (y+1)

isAlive :: Conway -> Cell -> Bool
isAlive = flip elem
