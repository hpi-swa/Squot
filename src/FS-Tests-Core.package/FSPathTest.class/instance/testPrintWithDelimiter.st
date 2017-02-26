tests
testPrintWithDelimiter
	| path |
	path := (FSPath * 'plonk') / 'griffle'.
	self assert: (path printWithDelimiter: $%) = 'plonk%griffle'