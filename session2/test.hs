module Conway_Test where

import Main hiding (main)

import Test.HUnit

import Data.List

assertConway message input expected = TestCase $ assertEqual
	message
	(sort expected) (sort (nextConway input))

assertEmptyReturnsEmpty = assertConway
	"Empty -> Empty"
	[] []

assertAliveGetsDead = assertConway
	"Single Alive -> Dead"
	[Cell 0 0] []

assert3InARowLeavesCentralAlive = assertConway
	"3 In A Row -> Central Alive"
	[Cell 0 0, Cell 1 0, Cell 2 0] [Cell 1 0]

assert4InARowLeavesCentralAlive = assertConway
	"4 In A Row -> Central Alive"
	[Cell 0 0, Cell 1 0, Cell 2 0, Cell 3 0] [Cell 1 0, Cell 2 0]

assertInterspersedDie = assertConway
	"Interspersed -> All Die"
	[Cell 0 0, Cell 2 0, Cell 4 0] []

assert3InAColumnHasCenterAlive = assertConway
	"3 in column -> centre alive"
	[Cell 0 0, Cell 0 1, Cell 0 2] [Cell 0 1]

assertDiagonal = assertConway
	"3 in diagon -> centre alive"
	[Cell 0 0, Cell 1 1, Cell 2 2] [Cell 1 1]

assertDiagonal2 = assertConway
	"3 in diagon #2 -> centre alive"
	[Cell 2 0, Cell 1 1, Cell 0 2] [Cell 1 1]

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
		,assertAliveGetsDead
		,assert3InARowLeavesCentralAlive
		,assert4InARowLeavesCentralAlive
		,assertInterspersedDie
		,assert3InAColumnHasCenterAlive
		,assertDiagonal
		,assertDiagonal2
	]
