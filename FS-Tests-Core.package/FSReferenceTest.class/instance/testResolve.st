tests
testResolve
	| ref |
	ref := filesystem referenceTo: FSPath / 'griffle'.
	self assert: ref resolve == ref