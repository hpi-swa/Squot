tests
testParseTrailingSlash
	| path |
	path := FSPath readFrom: 'griffle/' readStream delimiter: $/.
	self assert: path size = 1.
	self assert: (path at: 1) = 'griffle'