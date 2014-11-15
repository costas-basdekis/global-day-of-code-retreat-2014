module Conway_Test where

import Main hiding (main)

import Test.HUnit

assertConway message input expected = TestCase $ assertEqual
	message
	expected (nextConway input)

assertEmptyRemainsEmpty = assertConway
	"Empty -> Empty"
	Empty Empty

main = runTestTT $ TestList [
		assertEmptyRemainsEmpty
	]
