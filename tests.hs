module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertConwayEmpty = TestCase $ assertEqual 
	"Empty input -> Empty output"
	expected actual
	where
		expected = ""
		input = ""
  		actual = (nextConway input) 

main = runTestTT assertConwayEmpty
