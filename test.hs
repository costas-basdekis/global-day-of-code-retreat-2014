module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertConway message input expected = TestCase $ assertEqual
	message
	expected (nextConway input)

assertEmptyReturnsEmpty = assertConway
	"Empty -> Empty"
	[] []

assertAliveGetsDead = assertConway
	"Single Alive -> Dead"
	[Cell 0 0] []

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty,
		assertAliveGetsDead
	]
