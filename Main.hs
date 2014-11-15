module Main where

main = do
	putStrLn "hello, world"

data Cell = Cell {x :: Int, y :: Int} deriving (Eq, Show)

type Conway = [Cell]

nextConway :: Conway -> Conway
nextConway (x:y:xs) = [y]
nextConway _ = []

--isAlive :: Cell -> Conway -> Bool
--isAlive = elem
