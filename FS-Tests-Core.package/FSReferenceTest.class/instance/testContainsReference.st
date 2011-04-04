tests
testContainsReference
	| ref |
	ref := filesystem referenceTo: (FSPath * 'griffle').
	self assert: (ref contains: ref / 'nurp')