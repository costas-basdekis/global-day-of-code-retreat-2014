module Conway_Test where

import Main hiding (main)

import Test.HUnit

import Data.List

assertConway message input expected = TestCase $ assertEqual
	message
	expected (nextConway input)

assertEmptyReturnsEmpty = assertConway
	"Empty -> Empty"
	[] []

assertOneAliveDies = assertConway
	"One Alive -> Dead"
	[Cell 0 0] []

assert3InARowOnlyMiddleSurvives = assertConway
	"3 in a row -> Middle survives"
	[Cell 0 0, Cell 1 0, Cell 2 0] [Cell 1 0]

assert4InARowOnlyMiddleSurvives = assertConway
	"4 in a column -> Middle survives"
	[Cell 0 0, Cell 1 0, Cell 2 0, Cell 3 0] [Cell 1 0, Cell 2 0]

assertInterspersed = assertConway
	"intersperse none survives"
	[Cell 0 0, Cell 2 0, Cell 4 0] []

assertGetLeft = TestCase $ assertEqual
	"Get left of"
	(Cell (-1) 0) (leftOf (Cell 0 0))

assertGetRight = TestCase $ assertEqual
	"Get right of"
	(Cell 1 0) (rightOf (Cell 0 0))

assertGetLeftActual = TestCase $ assertEqual
	"Get left of with another test case"
	(Cell 9 15) (leftOf (Cell 10 15))

assertGetRightActual = TestCase $ assertEqual
	"Get right of with another test case"
	(Cell 11 15) (rightOf (Cell 10 15))

assertBothNeighboursAlive = TestCase $ assertEqual
	"asnlfa"
	False (bothNeightboursAlive [] (Cell 0 0))

assertBothNeighboursAliveWith3 = TestCase $ assertEqual
	"assertBothNeighboursAliveWith3"
	True (bothNeightboursAlive [Cell 0 0, Cell 1 0, Cell 2 0] (Cell 1 0)) 

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
		,assertOneAliveDies
		,assert3InARowOnlyMiddleSurvives
		,assert4InARowOnlyMiddleSurvives
		,assertGetLeft
		,assertGetRight
		,assertGetLeftActual
		,assertGetRightActual
		,assertBothNeighboursAlive
		,assertBothNeighboursAliveWith3
		,assertInterspersed
	]
