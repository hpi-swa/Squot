tests
testAbsolutePrintString
	| path actual |
	path := FSPath / 'plonk' / 'griffle'.
	actual := path printString.
	self assert: actual = 'FSPath / ''plonk'' / ''griffle'''