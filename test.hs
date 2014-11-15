module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertEmptyReturnsEmpty = TestCase $ assertEqual 
	"Empty -> Empty"
	[] (nextConway [])

assertAliveGetsDead = TestCase $ assertEqual 
	"Single Alive -> Dead"
	[] (nextConway [Cell 0 0])

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty,
		assertAliveGetsDead
	]
