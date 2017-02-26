tests
testBasename
	| path |
	path := FSPath * 'plonk' / 'griffle'.
	self assert: path basename = 'griffle'