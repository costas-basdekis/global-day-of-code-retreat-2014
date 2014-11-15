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

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
		,assertAliveGetsDead
		,assert3InARowLeavesCentralAlive
		,assert4InARowLeavesCentralAlive
		,assertInterspersedDie
	]
