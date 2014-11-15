module Conway_Test where

import Main hiding (main)

import Test.HUnit

assertConway message input expected = TestCase $ assertEqual
	message
	expected (nextConway input)


main = runTestTT $ TestList [
	]
