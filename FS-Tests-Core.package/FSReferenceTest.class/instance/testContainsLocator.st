tests
testContainsLocator
	| ref |
	ref := FSLocator imageDirectory resolve parent.
	self assert: (ref contains: FSLocator image)