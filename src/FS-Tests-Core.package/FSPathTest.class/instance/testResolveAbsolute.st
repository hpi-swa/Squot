tests
testResolveAbsolute
	| path |
	path := FSPath / 'griffle'.
	self assert: path resolve == path.
	self assert: path isAbsolute