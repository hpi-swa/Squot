tests
testParseTrailingSlash
	| path |
	path := FSPath from: 'griffle/' delimiter: $/.
	self assert: path size = 1.
	self assert: (path at: 1) = 'griffle'