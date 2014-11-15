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

assert3InAColumnOnlyMiddleSurvives = assertConway
	"3 in a column -> Middle survives"
	[Cell 0 0, Cell 0 1, Cell 0 2] [Cell 0 1]

assert4InARowOnlyMiddleSurvives = assertConway
	"3 in a column -> Middle survives"
	[Cell 0 0, Cell 0 1, Cell 0 2, Cell 0 3] [Cell 0 1, Cell 0 2]

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
		,assertOneAliveDies
		,assert3InARowOnlyMiddleSurvives
		,assert3InAColumnOnlyMiddleSurvives
		,assert4InARowOnlyMiddleSurvives
	]
