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
	"Single alive -> Single Dead"
	[[Alive]] [[Dead]]

assertConwayOneDead = assertConwayEquals
	"Single Dead -> Single Dead"
	[[Dead]] [[Dead]]

assertConway3x3AllDead = assertConwayEquals
	"Three by three all dead -> three by three all dead"
	[[Dead, Dead, Dead], 
	[Dead, Dead, Dead],
	[Dead, Dead, Dead]] 
	[[Dead, Dead, Dead], 
	[Dead, Dead, Dead],
	[Dead, Dead, Dead]] 

assertConway3x3OneRowAlive = assertConwayEquals
	"Three by three one row alive -> three by three middle alive"
	[[Dead, Dead, Dead], 
	[Alive, Alive, Alive],
	[Dead, Dead, Dead]] 
	[[Dead, Dead, Dead], 
	[Dead, Alive, Dead],
	[Dead, Dead, Dead]] 


main = runTestTT $ TestList [
		assertConwayEmpty,
		assertConwayOneAlive,
		assertConwayOneDead,
		assertConway3x3AllDead,
		assertConway3x3OneRowAlive
	]
