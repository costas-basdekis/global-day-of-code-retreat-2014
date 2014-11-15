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

cellCanDieFromUnderpopulation0 = TestCase $  assertEqual
	"cell should have died from underpopulation"
	True (cellShouldDieGivenNeighbours 0)
cellCanDieFromUnderpopulation1 = TestCase $  assertEqual
	"cell should have died from underpopulation"
	True (cellShouldDieGivenNeighbours 1)

cellStaysAliveWith2Neighbours = TestCase $  assertEqual
	"cell should have stayed alive"
	False (cellShouldDieGivenNeighbours 2)

cellStaysAliveWith3Neighbours = TestCase $  assertEqual
	"cell should have stayed alive"
	False (cellShouldDieGivenNeighbours 3)

cellCanDieFromOverpopulation = TestCase $  assertEqual
	"cell should have died from overpopulation"
	True (cellShouldDieGivenNeighbours 4)

cellSpringsToLifeIfHas3Neighbours = TestCase $  assertEqual
	"cell should have sprung into life"
	True (cellShouldSpringIntoLifeGivenNeighbours 3)
cellDoesNotSpringToLifeIfHasDifferentNumberOfNeighbours = TestCase $  assertEqual
	"cell should not have sprung into life"
	False (cellShouldSpringIntoLifeGivenNeighbours 2)

cellCanHaveNoNeighbours = TestCase $  assertEqual
	"cell should have no neighbours"
	0 (numberOfNeighbours empty (Cell 0 0))

cellCanHaveANeighbour = TestCase $  assertEqual
	"cell should have no neighbours"
	1 (numberOfNeighbours [Cell 0 1] (Cell 0 0))

main = runTestTT $ TestList [
		emptyRemainsEmpty
		,singleAliveDies
		--,quadStaysQuad
		,cellCanDieFromUnderpopulation0
		,cellCanDieFromUnderpopulation1
		,cellStaysAliveWith2Neighbours
		,cellStaysAliveWith3Neighbours
		,cellCanDieFromOverpopulation
		,cellSpringsToLifeIfHas3Neighbours
		,cellDoesNotSpringToLifeIfHasDifferentNumberOfNeighbours
		,cellCanHaveNoNeighbours
		,cellCanHaveANeighbour
	]
