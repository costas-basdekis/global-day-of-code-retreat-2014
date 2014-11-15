module Main where

main = do
	putStrLn "hello, world"

data Conway = Empty deriving (Eq, Show)

nextConway :: Conway -> Conway
nextConway _ = Empty
