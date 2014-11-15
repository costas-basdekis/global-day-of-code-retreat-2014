module Main where

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show)

type Board = [Cell]
empty = [] :: Board

nextConway :: Board -> Board
nextConway _ = empty

cellShouldDieGivenNeighbours :: Int -> Bool
cellShouldDieGivenNeighbours numberOfNeighbours = numberOfNeighbours /= 2
