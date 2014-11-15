module Main where

main = do
	putStrLn "hello, world"

data Board = Empty deriving (Eq, Show)

nextConway :: Board -> Board
nextConway x = x
