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

numberOfNeighbours :: Board -> Cell -> Int
numberOfNeighbours board (Cell x y) = if ((Cell x (y + 1)) `elem` board) then 1 else 0