module Conway_Test where

import Main hiding (main)

import Test.HUnit

assertConway message input expected = TestCase $ assertEqual
	message
	expected (nextConway input)

emptyRemainsEmpty = assertConway
	"Empty -> Empty"
	empty empty

singleAliveDies = assertConway
	"Alive -> Dead"
	[Cell 0 0] empty

quadStaysQuad = assertConway
	"Quad -> Quad"
	[Cell 0 0, Cell 1 0, Cell 0 1, Cell 1 1]
	[Cell 0 0, Cell 1 0, Cell 0 1, Cell 1 1]

cellCanDieFromUnderpopulation = TestCase $  assertEqual
	"cell should have died from underpopulation"
	True (cellShouldDieGivenNeighbours 0)

main = runTestTT $ TestList [
		emptyRemainsEmpty
		,singleAliveDies
		--,quadStaysQuad
		,cellCanDieFromUnderpopulation
	]
