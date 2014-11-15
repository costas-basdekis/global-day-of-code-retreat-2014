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

main = runTestTT $ TestList [
		assertEmptyRemainsEmpty
		,asserSingleAliveDies
	]
