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

offsetCell :: (Int, Int) -> Cell -> Cell
offsetCell (offsetx, offsety) (Cell x y) = Cell (offsetx + x) (offsety + y)

leftOf :: Cell -> Cell
leftOf = offsetCell (-1, 0)

rightOf :: Cell -> Cell
rightOf = offsetCell (1, 0)

aboveOf :: Cell -> Cell
aboveOf = offsetCell (0, -1)

belowOf :: Cell -> Cell
belowOf = offsetCell (0, 1)

isAlive :: Conway -> Cell -> Bool
isAlive = flip elem
