tests
testResolveRelative
	| path |
	path := FSPath * 'griffle'.
	self assert: path resolve == path.
	self assert: path isRelative