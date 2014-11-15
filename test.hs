module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertEmptyReturnsEmpty = TestCase $ assertEqual 
	"Empty -> Empty"
	[] (nextConway [])

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
	]
