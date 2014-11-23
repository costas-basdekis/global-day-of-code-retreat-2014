module Main where

main = do
	putStrLn "Hello, world"

data Cell = Alive | Dead deriving (Show, Eq)
type Conway = [[Cell]]

nextConway :: Conway -> Conway
nextConway xss = map (\xs -> nextRow xs) xss
--nextConway [] = []
--nextConway [[_]] = [[Dead]]
--nextConway  x = x

nextRow :: [Cell] -> [Cell]
NextRow (x:xs) = Dead : (doRest xs)

--nextCell :: Cell -> [[Cell]] -> Cell
--nextCell = undefined