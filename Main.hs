module Main where

main = do
	putStrLn "Hello, world"

data Cell = Alive | Dead deriving (Show, Eq)
type Conway = [[Cell]]

nextConway :: Conway -> Conway
nextConway [] = []
nextConway [[_]] = [[Dead]]
nextConway  x = x
