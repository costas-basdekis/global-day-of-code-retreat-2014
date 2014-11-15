module Main where

main = do
	putStrLn "hello, world"

data Cell = Cell {x, y :: Int} deriving (Eq, Show, Ord)

type Conway = [Cell]

nextConway :: Conway -> Conway
nextConway (_:y:_) = [y]
nextConway _ = []
