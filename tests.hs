module Conway_Test where

import Main hiding (main)

import Test.HUnit

import Data.List

assertConway message input expected = TestCase $ assertEqual
	message
	(sort expected) (sort (nextConway input))

assertEmptyReturnsEmpty = assertConway
	"Empty -> Empty"
	[] []

main = runTestTT $ TestList [
		assertEmptyReturnsEmpty
	]
