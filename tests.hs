module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertConwayEquals message input expected = TestCase $ assertEqual 
	message
	expected (nextConway input)

assertConwayEmpty = assertConwayEquals
	"Empty input -> Empty output"
	"" ""

main = runTestTT assertConwayEmpty
