module Conway_Test where

import Main hiding (main)

import Test.HUnit

assertConway message input expected = TestCase $ assertEqual
	message
	expected (nextConway input)

assertEmptyRemainsEmpty = assertConway
	"Empty -> Empty"
	empty empty

asserSingleAliveDies = assertConway
	"Alive -> Dead"
	[Cell 0 0] empty

asserQuadStaysQuad = assertConway
	"Quad -> Quad"
	[Cell 0 0, Cell 1 0, Cell 0 1, Cell 1 1]
	[Cell 0 0, Cell 1 0, Cell 0 1, Cell 1 1]

main = runTestTT $ TestList [
		assertEmptyRemainsEmpty
		,asserSingleAliveDies
		,asserQuadStaysQuad
	]
