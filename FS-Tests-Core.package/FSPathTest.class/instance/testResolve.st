tests
testResolve
	| path |
	path := FSPath / 'griffle'.
	self assert: path resolve == path