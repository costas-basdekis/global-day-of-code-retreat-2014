module Conway_Test where

import Main hiding (main)
import Test.HUnit

assertConwayEquals message input expected = TestCase $ assertEqual 
	message
	expected (nextConway input)

assertConwayEmpty = assertConwayEquals
	"Empty input -> Empty output"
	[] []

assertConwayOneAlive = assertConwayEquals
	"Empty input -> Empty output"
	[[Alive]] [[Dead]]

assertConwayOneDead = assertConwayEquals
	"Empty input -> Empty output"
	[[Dead]] [[Dead]]

main = runTestTT $ TestList [
		assertConwayEmpty,
		assertConwayOneAlive,
		assertConwayOneDead
	]
