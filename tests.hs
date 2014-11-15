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

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
		,assertOneAliveDies
	]
