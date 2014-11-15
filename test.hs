module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertEmptyReturnsEmpty = TestCase $ assertEqual 
	"Empty -> Empty"
	Empty (nextConway Empty)

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
	]
