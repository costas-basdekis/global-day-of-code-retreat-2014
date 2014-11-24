module Main where

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show)

type Board = [Cell]
empty = [] :: Board

nextConway :: Board -> Board
nextConway _ = empty

cellShouldDieGivenNeighbours :: Int -> Bool
cellShouldDieGivenNeighbours 2 = False
cellShouldDieGivenNeighbours 3 = False
cellShouldDieGivenNeighbours _ = True

cellShouldSpringIntoLifeGivenNeighbours :: Int -> Bool
cellShouldSpringIntoLifeGivenNeighbours 3 = True
cellShouldSpringIntoLifeGivenNeighbours _ = False

foo :: Board -> Cell -> Int
foo board cell = if (cell `elem` board) then 1 else 0

numberOfNeighbours :: Board -> Cell -> Int
numberOfNeighbours board (Cell x y) = foo board (Cell x (y + 1))